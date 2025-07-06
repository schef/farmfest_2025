\version "2.24.4"
\include "deutsch.ly"
jazzChords = { \semiGermanChords }
aFourL = {}
\include "include.ily"
%markMoj = #(define-music-function (letter) (string?) #{ \mark \markup { \box \bold #letter } #})
%\pointAndClickOff

\layout {
  indent = 0
}

\header {
  title = "ISUS NAZAREĆANIN"
  composer = "John Van Deusen"
  titlex = "Jesus Of Nazareth"
  style = ""
  broj = "4"
  %tagline = \markup { \override #'(font-name . "JohnSans White Pro") \override #'(font-size . -3) { Izvorno: Name, Album } }
}

\paper {
  \aFourL
  %min-systems-per-page = #7
  %annotate-spacing = ##t
  %system-system-spacing.padding = #3.2
  %page-breaking = #ly:one-page-breaking
  %last-bottom-spacing.minimum-distance = #8
}

staffOne = \relative c' {
  \time 3/4
  %\tempo 4 = 135
  \markMoj
  a'2 g4 |
  g4 c2 |
  d4 c4 d8 e8 |
  e4. d8 c4 |
  a2 g4 |
  g4. c4. |
  d2. |
  r2. | \break
  a4 a4 g4 |
  g4 c2 |
  d4 (c4 )e4 |
  e4. d8 c4 |
  a4 a4 g4 |
  g4. c4. (|
  d2. )|
  r4 r4 c8 d8 \bar "||" | \break
  \markMoj
  e2. |
  e2. |
  r4 f8 f4. |
  f4 e8 d4. |
  d4 d4 d8 d8 ~|
  d4 e4 f4 |
  e4. e4. |
  e4 d4 c4 | \break
  e2. |
  e4. d4. |
  f4. f4. |
  f4 e8 d4. |
  d4 d4 d8 d8 ~|
  d4 e4 f4 |
  e4. e4. |
  e4 d4 c4 | \break
  c2. |
  g'2. ~|
  g2. ~|
  g2. ~|
  g2. |
  r2. |
  e8 f4 e4. |
  d4 c8 d4. | \break
  c2. |
  g'2. (~|
  g2. ~|
  g2. |
  a2. )|
  r4 r4 e4 |
  e8 f4. e4 |
  d2 c4 |
  c2. |
}

harmonyOne = \chordmode  {
  f2. |
  c2. |
  g2. |
  a2.:m |
  f2. |
  c2. |
  g2. |
  s2. |
  f2. |
  c2. |
  g2. |
  a2.:m |
  f2. |
  c2. |
  g2. |
  s2. |
  c2. |
  s2. |
  f2. |
  s2. |
  g2. |
  s2. |
  a2.:m |
  f2. |
  c2. |
  s2. |
  f2. |
  s2. |
  g2. |
  s2. |
  a2.:m |
  g2. |
  f2. |
  s2. |
  c2. |
  g2. |
  f2. |
  s2. |
  a2.:m |
  g2. |
  f2. |
  s2. |
  c2. |
  g2. |
  f2. |
  s2. |
  a2.:m |
  g2. |
  s2. |
  \bar "|."
}

alignerOneZero = \relative {
  c2 c4 |
  c4 c2 |
  c4 c4 c8 c8 |
  c4. c8 c4 |
  c2 c4 |
  c4. c4. |
  c2. |
  r2. |
  c4 c4 c4 |
  c4 c2 |
  c4( c4) c4 |
  c4. c8 c4 |
  c4 c4 c4 |
  c4. c4.( |
  c2.) |
  r4 r4 c8 c8 |
  c2. |
  c2. |
  r4 c8 c4. |
  c4 c8 c4. |
  c4 c4 c8 c8( |
  c4) c4 c4 |
  c4. c4. |
  c4 c4 c4 |
  c2. |
  c4. c4. |
  c4. c4. |
  c4 c8 c4. |
  c4 c4 c8 c8 |
  r4 c4 c4 |
  c4. c4. |
  c4 c4 c4 |
  c2. |
  c2.( |
  c2. |
  c2. |
  c2.) |
  r2. |
  c8 c4 c4. |
  c4 c8 c4. |
  c2. |
  c2.( |
  c2. |
  c2. |
  c2.) |
  r4 r4 c4 |
  c8 c4. c4 |
  c2 c4 |
  c2. |
}

lyricOneZero = \lyricmode {
  \set stanza = "1." Go spo -- %|
  dar je %|
  I -- sus Na -- za -- %|
  re -- ća -- nin, %|
  moj Ot -- %|
  ku -- pi -- %|
  telj. %|
  %|
  Sad i za -- %|
  u -- vijek %|
  moj __ je %|
  za -- stup -- nik, %|
  mi -- lost bez %|
  mje -- re. __ %|
  %|
  Pje -- vam: %|
  zar %|
  me %|
  lju -- bi %|
  to -- li -- ko? %|
  Pro -- sti -- re se __ %|
  iz -- nad %|
  sveg o -- %|
  bja -- šnjiv -- og. %|
  Ne -- %|
  vje -- ro -- %|
  ja -- tno %|
  do -- bro je %|
  bi -- ti u mi -- %|
  lo -- sti %|
  sla -- ve %|
  nje -- go -- ve. %|
  Ne %|
  bih __ %|
  %|
  %|
  %|
  %|
  ni -- kad se %|
  vra -- ti -- o, %|
  nit' %|
  bih __ %|
  %|
  %|
  %|
  tu %|
  lju -- bav za -- %|
  mje -- ni -- %|
  o. %|
}

alignerOneOne = \relative {
  c2 c4 |
  c4 c2 |
  c4 c4 c8 c8 |
  c4. c8 c4 |
  c2 c4 |
  c4. c4. |
  c2. |
  r2. |
  c4 c4 c4 |
  c4 c2 |
  c4 r4 c4 |
  c4. c8 c4 |
  c4 c4 c4 |
  c4. c4.( |
  c2.) |
  r4 r4 r8 r8 |
  r2. |
  r2. |
  r4 r8 r4. |
  r4 r8 r4. |
  r4 r4 r8 r8 |
  r4 r4 r4 |
  r4. r4. |
  r4 r4 r4 |
  r2. |
  r4. r4. |
  r4. r4. |
  r4 r8 r4. |
  r4 r4 r8 r8 |
  r4 r4 r4 |
  r4. r4. |
  r4 r4 r4 |
  r2. |
  r2. |
  r2. |
  r2. |
  r2. |
  r2. |
  r8 r4 r4. |
  r4 r8 r4. |
  r2. |
  r2. |
  r2. |
  r2. |
  r2. |
  r4 r4 r4 |
  r8 r4. r4 |
  r2 r4 |
  r2. |
}

lyricOneOne = \lyricmode {
  \set stanza = "2." Pri -- ja -- %|
  telj moj %|
  I -- sus Na -- za -- %|
  re -- ća -- nin, %|
  znam, On %|
  lju -- bi %|
  me. %|
  %|
  Do -- bri je %|
  Pa -- stir, %|
  u -- vijek %|
  šti -- ti me, %|
  mi -- lost bez %|
  mje -- re. __ %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
  %|
}

\score {
    <<
    \new ChordNames { \jazzChords \harmonyOne }
    \new Staff {
        <<
        \new Voice { \staffOne }
        \new NullVoice = "alignerOneZero" { \alignerOneZero }
        \new Lyrics \lyricsto "alignerOneZero" { \lyricOneZero }
        \new NullVoice = "alignerOneOne" { \alignerOneOne }
        \new Lyrics \lyricsto "alignerOneOne" { \lyricOneOne }
        >>
    }
    >>
}

\markup {
  \column {
  }
  \hspace #1
  \column {
  }
}