\version "2.24.3"
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
  title = "TO DADE BOG"
  titlex = "(Es Walte Gott)"
  composer = "Rebecca Watta"
  style = ""
  broj = "6"
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
  \key fis \major
  \time 3/4
  %\tempo 4 = 75
  \partial 4.
  ais'8 cis8 fis8 \bar "||" |
  \time 5/8
  \markMoj
  dis4 cis8 cis8 h8 |
  \time 4/4
  cis4 ais4 r8 gis8 ais8 dis8 |
  \time 3/4
  cis8 h8 ais4 gis4 |
  fis4. ais8 cis8 fis8 | \break
  \time 5/8
  dis4 cis8 cis8 h8 |
  \time 4/4
  cis4 ais4 r8 gis8 ais8 dis8 |
  \time 3/4
  cis8 h8 ais4 gis4 |
  fis4. fis8 gis8 cis8 \bar "||" | \break
  \time 5/8
  \markMoj
  ais4 fis8 h8 gis8 |
  cis4 dis4 eis8 |
  fis4 eis8 dis8 fis8 |
  eis4 cis8 cis8 fis8 \bar "||" | \break
  \time 5/8
  dis4 cis8 cis8 h8 |
  \time 4/4
  cis4 ais4 r8 gis8 ais8 dis8 |
  \time 3/4
  cis8 h8 ais4 gis4 |
  fis4. r8 r4 |
}

harmonyOne = \chordmode  {
  s4. |
  h4. gis8:m7 s8 |
  cis4 dis8:m s4 cis4 s8 |
  h4 fis8/cis s8 cis4 |
  fis8 s4. fis8/ais s8 |
  h4. gis4:m7 |
  cis4 dis4.:m cis8 s4 |
  h4 fis4/cis cis4 |
  fis2 cis4/eis |
  fis4 s8 gis4:m7 |
  fis8/ais s8 h4. |
  dis4.:m gis8/his s8 |
  cis4. fis4/ais |
  h4 s8 gis4:m7 |
  cis8 s8 dis4.:m cis4. |
  h8 s8 fis4/cis cis8 s8 |
  fis4. s8 fis4/ais |
  \bar "|."
}

alignerOneZero = \relative {
  c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 c8 |
  c4 c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. r8 r4 |
}

lyricOneZero = \lyricmode {
  To da -- de %|
  Bog u mo -- me %|
  sr -- cu Po vo -- lji %|
  Kri -- sta I -- su -- %|
  sa Dal’ slav -- lje, %|
  pi -- ta -- nja il' %|
  su -- ze On dr -- ži %|
  sve u ru -- ka -- %|
  ma On vje -- čno %|
  ču -- va mo -- je %|
  i -- me Ni %|
  dug mi ne bro -- %|
  ji Sra -- mo -- te %|
  mo -- je vi -- še %|
  ne -- ma Riječ Nje -- go -- %|
  va je do -- volj -- %|
  na. %|
}

alignerOneOne = \relative {
  c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 c8 |
  c4 c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. r8 r4 |
}

lyricOneOne = \lyricmode {
  To da -- de %|
  Bog, naš do -- bar %|
  O -- tac On sve -- mo -- %|
  ćan je je -- di -- %|
  ni Ne su -- sta -- %|
  je i ne -- će %|
  pas -- ti I dr -- ži %|
  što o -- be -- ća -- %|
  je Na gla -- vi %|
  bro -- ji sva -- ku %|
  vlas On put %|
  do -- bar po -- zna -- %|
  je· Ko -- ji kroz %|
  ta -- mu me -- ne %|
  vo -- di u svo -- je %|
  ru -- ke ši -- ro -- %|
  ke. %|
}

alignerOneTwo = \relative {
  c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 c8 |
  c4 c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c8 c8 c8 |
  c4 c4 r8 c8 c8 c8 |
  c8 c8 c4 c4 |
  c4. r8 r4 |
}

lyricOneTwo = \lyricmode {
  To da -- de %|
  Bog, sve što ja %|
  je -- sam, Moj ži -- vot %|
  nje -- mu pri -- pa -- %|
  da Nje -- gov je %|
  svijet i sve na %|
  nje -- mu Po njem’ do -- %|
  bi -- va smi -- sa -- %|
  o Me -- ne je %|
  pr -- vi lju -- bi -- %|
  o Po -- zna -- %|
  o i cije -- ni -- %|
  o Ži -- vot je %|
  si -- gu -- ran u %|
  nje -- mu· gdje ne -- iz -- %|
  mjer -- no vrije -- dan %|
  sam. %|
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
        \new NullVoice = "alignerOneTwo" { \alignerOneTwo }
        \new Lyrics \lyricsto "alignerOneTwo" { \lyricOneTwo }
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