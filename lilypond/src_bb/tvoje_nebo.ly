\version "2.24.3"
\include "deutsch.ly"
jazzChords = { \semiGermanChords }
aFourR = {}
\include "include.ily"
%markMoj = #(define-music-function (letter) (string?) #{ \mark \markup { \box \bold #letter } #})
%\pointAndClickOff

\layout {
  indent = 0
}

\header {
  title = "TVOJE NEBO"
  titlex = "Tvoje Nebo"
  composer = "Danko Tomanić"
  style = ""
  broj = "7"
  %tagline = \markup { \override #'(font-name . "JohnSans White Pro") \override #'(font-size . -3) { Izvorno: Name, Album } }
}

\paper {
  \aFourR
  %min-systems-per-page = #7
  %annotate-spacing = ##t
  %system-system-spacing.padding = #3.2
  %page-breaking = #ly:one-page-breaking
  %last-bottom-spacing.minimum-distance = #8
}

staffOne = \relative c' {
  \key d \major
  \time 4/4
  %\tempo 4 = 114
  \clef treble
  \markMoj
  r8 h'8 h8 a8 h8 a8 h8 a8 ~|
  a8 e8 ~e4 r2 |
  r8 h'8 h8 a8 h8 h8 a8 a8 (~|
  a16 h16 cis8 ~cis4 )r2 |
  r8 h8 h8 a8 h8 a8 h8 a8 ~|
  a8 e8 ~e4 r2 |
  r8 g8 g8 fis8 g8 fis8 g8 e8 ~|
  e2 r2 \bar "||" | \break
  \markMoj
  r4 d'8 cis8 d8 cis8 d8 d8 (~|
  d8 e8 ~e4 )r2 |
  r4 fis8 e8 fis8 e8 fis8 fis8 (~|
  fis8 g8 ~g4 )r8 fis4 g8 |
  a2 \tuplet 3/2 { a4 g4 fis4 } |
  e2 fis4. cis8 |
  e8 d8 (~d4 ~d8 cis8 d8 cis8 |
  d1 )\bar "|." |
}

harmonyOne = \chordmode  {
  e1:m7 |
  a1:7 |
  e1:m7 |
  a1:7 |
  e1:m7 |
  a1:7 |
  e1:m7 |
  a1 |
  d1 |
  a1 |
  h1:m |
  g1 |
  d1 |
  a2 fis2:7 |
  h1:m |
  g1 |
  \bar "|."
}

alignerOneZero = \relative {
  r8 c8 c8 c8 c8 c8 c8 c8 |
  r8 c8( c4) r2 |
  r8 c8 c8 c8 c8 c8 c8 c8( |
  c16 c16 c8 c4) r2 |
  r8 c8 c8 c8 c8 c8 c8 c8 |
  r8 c8( c4) r2 |
  r8 c8 c8 c8 c8 c8 c8 c8( |
  c2) r2 |
  r4 c8 c8 c8 c8 c8 c8( |
  c8 c8 c4) r2 |
  r4 c8 c8 c8 c8 c8 c8( |
  c8 c8 c4) r8 c4 c8 |
  c2 \tuplet 3/2 {c4 c4 c4} |
  c2 c4. c8 |
  c8 c8( c4 c8 c8 c8 c8 |
  c1) |
}

lyricOneZero = \lyricmode {
  Sad ru -- ke po -- di -- žem te -- %|
  bi __ %|
  te -- bi sam sve pre -- da -- o __ %|
  %|
  i svo -- je sto -- pe sad ne -- %|
  bih __ %|
  bez te -- be po -- kre -- nu -- o __ %|
  %|
  Još te o -- sje -- čam tu __ %|
  %|
  Ko da ho -- dam po tlu __ %|
  la -- ga -- %|
  no na prs -- ti -- %|
  ma tvo -- je %|
  ne -- bo __ %|
  %|
}

alignerOneOne = \relative {
  r8 c8 c8 c8 c8 c8 c8 c8 |
  r8 c8( c4) r2 |
  r8 c8 c8 c8 c8 c8 c8 c8( |
  c16 c16 c8 c4) r2 |
  r8 c8 c8 c8 c8 c8 c8 c8( |
  c8) c8( c4) r2 |
  r8 c8 c8 c8 c8 c8 c8 c8( |
  c2) r2 |
  r4 r8 r8 r8 r8 r8 r8 |
  r8 r8 r4 r2 |
  r4 r8 r8 r8 r8 r8 r8 |
  r8 r8 r4 r8 r4 r8 |
  r2\tuplet 3/2 { r4 r4 r4} |
  r2 r4. r8 |
  r8 r8 r4 r8 r8 r8 r8 |
  r1 |
}

lyricOneOne = \lyricmode {
  Tvo -- ja me lju -- bav u -- mi -- %|
  va __ %|
  ko ro -- sa mi -- ri -- sni cvijet __ %|
  %|
  sve mo -- je "s to" -- bom pre -- bi __ %|
  va __ %|
  _ ti si je -- di -- ni svet __ %|
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
