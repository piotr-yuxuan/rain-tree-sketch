\version "2.19.16"
\language "italiano"

\paper {
  #(set-paper-size "a4")
}

\layout {
  \context {
    \Score
    \remove "Timing_translator"
    \remove "Default_bar_line_engraver"
  }
  \context {
    \Staff
    \consists "Timing_translator"
    \consists "Default_bar_line_engraver"
  }
}

right = \relative do' {
  \time 5/8
  \set subdivideBeams = ##t
  mib16[ fa' do mi'! mi,! si'! fad sol' sib, sib'] \bar "|"
  mib,,,[ fa' do mi'! mi,! si'! fad sol' sib, sib'] \bar "|"
  mib,,,[ fa' do mi'! mi,! si'! fad sol' sib, sib'] \bar "|"
  mib,,,[ fa' do mi'! mi,! si'! fad sol' sib, sib'] \bar "|"
  mib,,,[ fa' do mi'! mi,! si'! fad sol']
}

left = \relative do' {
  \time 4/8
  \set subdivideBeams = ##t
  \partial 16
  r16
  la[ lab' do, fad mib la re lab']
  la,,[ lab' do, fad mib la re lab']
  la,,[ lab' do, fad mib la re lab']
  la,,[ lab' do, fad mib la re lab']
  la,,[ lab' do, fad mib la re lab']
  la,,[ lab' do, fad mib la re lab']
}

\score {
  \new PianoStaff <<
    \new Staff \right
    \new Staff \left
  >>
  \layout { }
}
