\version "2.18.2"
\language "italiano"

% snippet inspired by Kevin Barry <barrykp@gmail.com>.

\layout {
  \context {
    \PianoStaff
    \consists #Span_stem_engraver
  }
  \context {
    \Staff
    \remove "Time_signature_engraver" % Remove time signature from the staff.
  }
}

rha = \relative {
  \voiceOne
  s16 s8 s4 sol''''16[ sib,]\laissezVibrer
}

rhb = \relative {
  <si dod mi>16[ <re mib lab>8]~ q8\laissezVibrer
  \ottava #1
  \voiceTwo
  \omit TupletBracket
  \once \override Beam.positions = #'(-4 . -4)
  \tuplet 3/2 { la''16^\accent[ lab' mi~ } <la, mi' lab>8]
}

rhc = \relative {
  s16 s4
  \hideNotes
  \override NoteColumn.ignore-collision = ##t
  la''8~ la
}

rhd = \relative {
  s16 s4
  \hideNotes
  \override NoteColumn.ignore-collision = ##t
  \omit TupletNumber
  \tuplet 3/2 8 { s16 lab'''8~ } lab
}
right = \new Staff = "right" \relative do' {
  \voiceThree
  \partial 8
  <mi sol do>8\laissezVibrer
  \bar "!"

  <<

    \new Staff \with {
      alignAboveContext = #"right"
    } \relative do''' {
      r8. <la, mi'>16[\laissezVibrer <si red fad>8] ~ <si red fad>8.\laissezVibrer
    }
    \new Dynamics \with {
      alignAboveContext = #"right"
    } s8. s\mf
    \new Staff \with {
      alignAboveContext = #"right"
    } \relative do'' {
      r8. <fa, dod'>16[\laissezVibrer sol8] ~ sol8.
    }

    \set Score.timing = ##f % Remove time counting, so measure bar needs to be explicitly stated.
    \accidentalStyle Score.forget
    \new Voice \rha
    \new Voice \rhb
    \new Voice \rhc
    \new Voice \rhd
  >>
  \bar "|"
}

left = \new Staff \relative do' {
  \autoBeamOff
  \crossStaff {
    do8\laissezVibrer
  }
  \autoBeamOn
  \clef bass
  <re, lab'>16[ <fa si>8] ~ q8
  \clef treble
  si'!16[\laissezVibrer fa' ~ fa dod'] \laissezVibrer
}

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } {
    <<
      \cadenzaOn
      \right
      \left
    >>
  }
  \layout { }
}