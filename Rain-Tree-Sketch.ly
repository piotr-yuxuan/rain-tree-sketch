\version "2.19.16"
\language "italiano"

\include "text.ly"

#(set-global-staff-size 22)

\paper {
  #(set-paper-size "a4")
}

\layout {
  \context {
    \PianoStaff
    \consists #Span_stem_engraver
  }
  \context {
    \Staff
    \remove "Time_signature_engraver" % Remove time signature from the staff.
  }
  \context {
    \Voice
    \stemNeutral
  }
}

% TODO: put LH, RH and bracket hand signs.

% There is three kind of accents: \rtoe, \ltoe and -> to keep the glyph similar.

global = {
  \set Score.timing = ##f % Remove time counting, so measure bar needs to be explicitly stated.
  \accidentalStyle Score.forget % modern-cautionary or forget
  % I'd like to make laissezVibrer wider but this snippet doesn't work :/
  % http://www.lilypond.org/doc/v2.18/Documentation/snippets/expressive-marks#expressive-marks-laissez-vibrer-ties
  \set subdivideBeams = ##t
}

\include "right.ly"
right = {
  %\rightZero
  %\rightOne
  %\rightTwo
  \rightThree
}

\include "left.ly"
left = {
  \voiceOne
  %\leftZero
  %\leftOne
  %\leftTwo
  \clef bass
  \leftThree
}

\include "dynamics.ly"
dynamics = {
  %\dynamicsZero
  %\dynamicsOne
  %\dynamicsTwo
  \dynamicsThree
}

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    %\set PianoStaff.connectArpeggios = ##t
    %\override PianoStaff.Arpeggio.stencil = #ly:arpeggio::brew-chord-bracket
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } {
      \global \right
    }
    \new Dynamics = "Dynamics_pf" \dynamics
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } {
      \global \left
    }
  >>
  \layout {
  }
  \midi { }
}

%\comments

%{
convert-ly (GNU LilyPond) 2.19.16  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16
%}
