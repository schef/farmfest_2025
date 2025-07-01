#!/usr/bin/python

import os
import sys
import select
import pty
from subprocess import Popen
from dataclasses import dataclass
from enum import Enum
import shutil
from pathlib import Path
from typing import Optional

#VERBOSE = False
VERBOSE = True

LILYPOND_GENERATOR_EXEC="python ~/../schef_backup/git/duhovne_pjesme_novi_sad_1966/scripts/new/lilypond_generator.py"
LILYPOND_VERSION="2.24.3"
LILYPOND_BIN_PATH="lilypond"
LILYPOND_CONFIG_PATH="./lilypond/config/"
POINT_AND_CLICK="--no-point-and-click"
#POINT_AND_CLICK="--point-and-click"

class TCOL:
    # Foreground:
    MAGENTA = '\033[95m'
    BLUE = '\033[94m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    # Formatting
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    # End colored text
    END = '\033[0m'
    NC = '\x1b[0m'  # No Color

class PageOrientation(Enum):
    Left = "--left-page"
    Right = "--no-left-page"

@dataclass
class Transposition:
    name: str
    musescore_path: str
    lilypond_path: str
    pdf_path: str
    transformer_func: Optional[str]

@dataclass
class Song:
    name: str
    ordinal_number: int
    page_orientation: PageOrientation

song_list = [
    Song("bog_je_moja_snaga", 1, PageOrientation.Right), #1

    Song("ime_isus", 2, PageOrientation.Left), #1
    # slika

    Song("pastir_moje_duse", 3, PageOrientation.Left), #2

    Song("poziv", 4, PageOrientation.Left), #1
    #slika

    Song("psalam_42", 5, PageOrientation.Left), #2

    Song("to_dade_bog", 6, PageOrientation.Left), #1
    Song("tvoje_nebo", 7, PageOrientation.Right), #1

    Song("u_duhu_budite_gorljivi", 8, PageOrientation.Left), #1
    #slika

    Song("vidjeh_oblak", 9, PageOrientation.Right), #2
]

transposition_list = [
    #Transposition("C", "./musescore/src_c", "./lilypond/src_c", "./lilypond/bin_c", None),
    Transposition("Bb", "./musescore/src_bb",  "./lilypond/src_bb", "./lilypond/bin_bb", None),
    #Transposition("Eb", "./musescore/src_eb",  "./lilypond/src_eb", "./lilypond/bin_eb", None),
    #Transposition("Bass", "./musescore/src_c", "./lilypond/src_bass", "./lilypond/bin_bass", "transpose-bass"),
    #Transposition("BassTonesOnly", "./musescore/src_c","./lilypond/src_bto", "./lilypond/bin_bto", "bass-tones-only")
]

def run_bash_cmd(cmd, logger=None, interaction={}, return_lines=True, return_code=False, cr_as_newline=False, remove_empty_lines=False):
    if VERBOSE:
        logger = print
    if logger: logger(f"CMD: {cmd}")
    master_fd, slave_fd = pty.openpty()
    line = ""
    lines = []
    with Popen(cmd, shell=True, preexec_fn=os.setsid, stdin=slave_fd, stdout=slave_fd, stderr=slave_fd, universal_newlines=True) as p:
        while p.poll() is None:
            r, w, e = select.select([sys.stdin, master_fd], [], [], 0.01)
            if master_fd in r:
                o = os.read(master_fd, 10240).decode("UTF-8")
                if o:
                    for c in o:
                        if cr_as_newline and c == "\r":
                            c = "\n"
                        if c == "\n":
                            if line and line not in interaction.values():
                                clean = line.strip().split('\r')[-1]
                                lines.append(clean)
                                if logger: logger(f"STD: {repr(line)}")
                            line = ""
                        else:
                            line += c
            if line:  # pass password to prompt
                for key in interaction:
                    if key in line:
                        if logger: logger(f"PMT: {line}")
                        os.write(master_fd, ("%s" % (interaction[key])).encode())
                        os.write(master_fd, "\r\n".encode())
                        line = ""
        if line:
            clean = line.strip().split('\r')[-1]
            lines.append(clean)

    os.close(master_fd)
    os.close(slave_fd)

    if remove_empty_lines:
        lines = list(filter(lambda l: len(l) > 0, lines))

    if return_lines and return_code:
        if logger: logger(f"RET: L[{lines}], C[{p.returncode}]")
        return lines, p.returncode
    elif return_code:
        if logger: logger(f"RET: C[{p.returncode}]")
        return p.returncode
    else:
        if logger: logger(f"RET: L{lines}")
        return lines

def get_full_path(path):
    return os.path.realpath(os.path.expanduser(path))

def check_if_path_exists(path):
    return os.path.exists(get_full_path(path))

def create_path(path):
    os.makedirs(get_full_path(path), exist_ok=True)

def remove_path(path, sudo_required=False):
    if check_if_path_exists(path):
        if not sudo_required:
            shutil.rmtree(get_full_path(path))
        else:
            run_bash_cmd(f"sudo rm {get_full_path(path)} -r")

def remove_file(path, sudo_required=False):
    if check_if_path_exists(path):
        if not sudo_required:
            os.remove(get_full_path(path))
        else:
            run_bash_cmd(f"sudo rm {get_full_path(path)}")

def get_file_list_in_path(path):
    return os.listdir(path)

def get_path_of_current_file(f):
    return str(Path(f).resolve().parent)

def create_dir_if_not_found(path):
    if not os.path.exists(get_full_path(path)):
        os.makedirs(get_full_path(path))

def convert_musescore_to_lilypond(song: Song, transposition: Transposition):
    print(f"convert_musescore_to_lilypond: {TCOL.BLUE}{song.ordinal_number}{TCOL.END}, {TCOL.BOLD}{TCOL.GREEN}{song.name}{TCOL.END}")
    musescore_path = get_full_path(f"{transposition.musescore_path}/{song.name}.mscx")
    lilypond_path = get_full_path(f"{transposition.lilypond_path}/{song.name}.ly")
    if not check_if_path_exists(musescore_path):
        print(f"  {TCOL.YELLOW}no musescore file{TCOL.END}")
        return
    cmd = f"{LILYPOND_GENERATOR_EXEC} {musescore_path} --ly-output {lilypond_path} --lilypond-version {LILYPOND_VERSION} --custom-config --ordinal-number {song.ordinal_number} {song.page_orientation.value} {POINT_AND_CLICK} --comment-tempo"
    run_bash_cmd(cmd)

def transform_lilypond(transposition: Transposition):
    if transposition.transformer_func is None:
        return
    print(f"transform_lilypond {TCOL.BOLD}{transposition.name}{TCOL.END}")
    cmd = f"python lilypond_transformer.py {transposition.transformer_func} {transposition_list[0].lilypond_path} --path-out {transposition.lilypond_path}"
    run_bash_cmd(cmd)

def generate_lilypond(song: Song, transposition: Transposition):
    print(f"generate_lilypond: {TCOL.BLUE}{song.ordinal_number}{TCOL.END}, {TCOL.BOLD}{TCOL.GREEN}{song.name}{TCOL.END}, {TCOL.MAGENTA}transposition: {transposition.name}{TCOL.END}")
    lilypond_source_path = get_full_path(f"{transposition.lilypond_path}/{song.name}.ly")
    if not check_if_path_exists(lilypond_source_path):
        print(f"  {TCOL.RED}no lilypond file{TCOL.END}")
        return

    cmd = f"{LILYPOND_BIN_PATH} -I {get_full_path(LILYPOND_CONFIG_PATH)} -o {get_full_path(transposition.pdf_path)} {lilypond_source_path}"
    run_bash_cmd(cmd)

if __name__ == "__main__":
    for transposition in transposition_list:
        create_dir_if_not_found(get_full_path(transposition.lilypond_path))
        for song in song_list:
            convert_musescore_to_lilypond(song, transposition)
        transform_lilypond(transposition)
        create_dir_if_not_found(get_full_path(transposition.pdf_path))
        for song in song_list:
            generate_lilypond(song, transposition)
