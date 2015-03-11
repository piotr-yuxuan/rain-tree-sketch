\version "2.18.2"
\language "italiano"

\header {
  dedication = "To Maurice Fleuret, for his fiftieth birthday"
  title = \markup { \override #'(font-name . "教育部標準楷書") "雨の樹素描" }
  subsubtitle = "Rain Tree Sketch, for piano"
  instrument = "ピアノのための"
  composer = \markup { \override #'(font-name . "教育部標準楷書") "武満徹" }
  copyright = \markup { "Engraved by" \override #'(font-name . "教育部標準楷書") "胡雨軒" }
}

comments = \markuplist {
  \vspace #1
  \justified-lines {
    Duration: 3 minutes
  }
  \justified-lines {
    Rain Tree Sketch for piano was premiered by Kazuoki Fujii in Tokyo on Januart 14, 1983.
  }
  \vspace #1
  \justified-lines {
    Most of this piece is played softly, except for those few places where the dynamics are specifically indicated.
  }
  \justified-lines {
    There are three different types of accent: ∧, > and ∨. ∧ indicates the use of strong accent; < indicates that a moderate accente should be used and ∨ indicates the use of a soft accent.
  }
  \justified-lines {
    Three differents kinds of fermata also appear: \musicglyph #"scripts.uverylongfermata", \musicglyph #"scripts.ufermata" and \musicglyph #"scripts.ushortfermata". \musicglyph #"scripts.uverylongfermata" is very long; \musicglyph #"scripts.ufermata" is medium and \musicglyph #"scripts.ushortfermata" is short.
  }
  \justified-lines {
    The \musicglyph #"accidentals.sharp" and \musicglyph #"accidentals.flat" signs apply to one note only.
  }
  \justified-lines {
    R., L. ans Sus are guides for pedalling. R. stands for right pedal (damper), L. stands for left pedal (soft) and Sus. stands for middle pedal (sostenuto).
  }
  \vspace #1
  \justified-lines {
    Addendum from the engraver: fermata glyphs have been modernised according to common usage. Moreover, due to technical limitations, pedalling guides have been carefully changed but remain strictly equivalent to the original.
  }
  \vspace #1
}

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
% I want to print bar number.

global = {
  \set Score.timing = ##f % Remove time counting, so measure bar needs to be explicitly stated.
  \accidentalStyle Score.forget % modern-cautionary or forget
  % I'd like to make laissezVibrer wider but this snippet doesn't work :/
  % http://www.lilypond.org/doc/v2.18/Documentation/snippets/expressive-marks#expressive-marks-laissez-vibrer-ties
  \set subdivideBeams = ##t
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
  \tuplet 3/2 { la''!16^\accent[ lab' mi~ } <la, mi' \tweak Accidental.stencil ##f lab>8]
  \ottava #0
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

% We choose to deal with measure bars with the right voice. We could have added a dynamics staff but this seems to be the easiest solution. So while the the score is being written, it means the right hand needs to keep more up to date than the left one or at least equal.

right = \relative do'' {
  \voiceOne
  % Clef is a property of the voice because it changes more often than usual.
  \clef treble
  \set Score.currentBarNumber = #1
  <sold fa'! la>8_[ <sib' sold'>16] <dod mi>8->_[ fa,16^\rtoe]

  % bar n°2

  si16_[( sib']) sol_[ si,8]^\ltoe

  % bar n°3

  <sold, fa' la>16_[ <sib' sold'>16] <dod mi>8_[( fa,16])

  % bar n°4

  <mi' sold>16_[ <re sol>8->(^\> <si fa'>16) mib16( dod)]\!

  % bar n°5

  << { la16[( sold'->) mi\rtoe] ~ mi8[ si!16]\laissezVibrer } \\ { sol8[ sib16]~ sib8[ sol16\laissezVibrer] } >>

  % bar n°6

  r8. r8

  % bar n°7

  <lab fa' sib>16_[( <sib mi la>]) si!_[(
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  sol'!)
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  fa mib dod8\laissezVibrer] \mark \markup {\normalsize "l.v"}

  % bar n°8

  << { sol16[( fad')\ltoe re->] ~ re8[ la!]\laissezVibrer } \\ { fa8[ lab16] ~ lab8[ fa!]\laissezVibrer } >>

  % bar n°9

  r16 r r

  % bar n°10

  << { fa16[( mi'!)-> do] ~ do[ sol8]\laissezVibrer } \\ { mib8[ fad16] ~ fad[ mib8]\laissezVibrer } >>

  % bar n°11

  r16 r r

  % bar n°12

  sol16_[ lab( mi')] si16_[ <sol' sib>8(->^\markup{ \tiny "(si)"} <mi dod'>16])^\ltoe^\markup{ \tiny "(do)"}\laissezVibrer

  % bar n°13

  r8. r8

  % bar n°14

  \ottava #1
  fa'16_[ mi
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  dod
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  si sib] \bar "!"
  \ottava #0
  <lab,, sol'>16\laissezVibrer
  \bar "!"
  \ottava #1
  <si''! re>16->_[ <do, la'!>->( <fa lab>)]\ltoe\laissezVibrer

  % bar n°15
  r16 r

  % bar n°16

  <do' mib>16_[ <la re>
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  <fad si>
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  fad fa!] \bar "!"
  \ottava #0
  <dod, fad>16\laissezVibrer \bar "!"
  do'8(_[\ltoe si16)]\laissezVibrer

  % bar n°17

  r16 r

  % bar n°18

  mib,16\laissezVibrer \bar "!"
  la8\ltoe_[( sold16])

  % bar n°19

  r16 r16

  % bar n°20

  <do, fa>8._[->\> <si dod re>8]\! \bar "!"
  <re fa!>8_[ <dod fad>8.->( <do! fa!>16]) \bar "!"
  <si mi>8_[( <sold sib dod>8])\ltoe

  % bar n°21

  <fad sol si>16_[\(
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  <lab do>
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  <re fa>
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  <fad la>
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  <fa! dod> <si mi>\)]

  % bar n°22

  <fa'! lab>8._[ <mi! la!>8\rtoe-\markup { \center-align \small "poco rall." } <si lab'>16]-> \bar "!"
  <do sol'>4.\laissezVibrer

  % bar n°23

  r8. r8 sol, ~

  % bar n°24

  <dob, mib sol lab>8.[ ~ <dob mib sol lab>16 <fa la! lab>8 <do! fad si re>16]

  % bar n°25

  <<
    { <la re mib lab>4 } \\ {
      \times 2/3 {
        r16
        \set stemLeftBeamCount = #2
        \set stemRightBeamCount = #2
        fad'[
        \set stemLeftBeamCount = #2
        \set stemRightBeamCount = #1
        fa'!
      } \times 2/3 {
        \set stemLeftBeamCount = #1
        \set stemRightBeamCount = #2
        si mib sol]
      }
      \ottava #1
      \once \override TupletNumber.text = #tuplet-number::calc-fraction-text
      \times 3/4 { sib16[ <fad do'> <la re> <dod mi>]\laissezVibrer }
      \ottava #0
    }
  >>

  % bar n°26

  r16 r16 r16

  % bar n°27

  <<

    \new Staff \with {
      alignAboveContext = #"right"
    } \relative do''' {
      r8. <la, mi'>16[\laissezVibrer\mf <si red fad>8] ~ <si red fad>8.\laissezVibrer
    }
    \new Dynamics \with {
      alignAboveContext = #"right"
    } s8. s
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

  % bar n°28

  r16 r r

  % bar n°29

  <<
    {
      \new Voice {
        \voiceOne
        \tuplet 3/2 { <si,,, dod mi>[ <mib lab>\ltoe <mi! sol>] }
        <sib do! fab sold>16[->
        <mi! fa! la!>8]\laissezVibrer
        <lab lab'>\laissezVibrer
      }
    }
    {
      \new Voice {
        \voiceTwo
        s8*1/3
        re,8\laissezVibrer        
      }
    }
    {
      \new Voice {
        \voiceThree
        s4 s16 r16 <si'' mib sol>8\laissezVibrer\shortfermata
      }
    }
  >>
}

%<< {  } \\ {  } >>

left = \relative do {
  \clef treble
  <fad do'>16[ re' la'] <do,! re'>16[ fad8]
  << { la16[ sold'^\rtoe] mi8->[ fa,16] } \\ { re8~re8. } >>
  <fad, do'>16[ re'] la'[ do, re']
  << { <red, si'>4. } \\ { la'16[ sold'^\rtoe mi8^\> fa,16^( si\!)] } \\ { s8 mi4 }>>
  si,16[\laissezVibrer fa'\laissezVibrer dod'] ~ dod[ <fa lab>8->\laissezVibrer]
  r8. r8
  <<
    {
      dod,16[( fa]) la[
      \set stemLeftBeamCount = #2
      \set stemRightBeamCount = #1
      sold'->
      \set stemLeftBeamCount = #1
      \set stemRightBeamCount = #2
      mi fa,8-> si16\laissezVibrer]
    } \\ { si,16 ~ <si do>4.\laissezVibrer } % this is not fully correct because we want si and do not to be repeated.
  >>
  la16\laissezVibrer[ mib'\laissezVibrer si'] ~ si[ <mib fad>8.]->\laissezVibrer
  r16 r r
  sol,,16[\laissezVibrer dod\laissezVibrer la'\laissezVibrer <dod mi!>8.\ltoe]\laissezVibrer
  r16 r r
  <<
    {
      <si, fa'>16[ <dod sib'> <la' fa'>] \times 2/3 {
        do!16[ lab,
        \set stemLeftBeamCount = #2
        \set stemRightBeamCount = #1
        re^\rtoe\>\laissezVibrer
        \set stemLeftBeamCount = #1
        \set stemRightBeamCount = #2
      } \times 2/3 { fad\laissezVibrer fa'!\laissezVibrer do'!]\!\laissezVibrer }
    } \\ { s8. s4*1/3 re,,4*2/3 }
  >>
  r8. r8
  sib'16[ lab, \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  re
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  mi' fa,16]

  \autoBeamOff
  \crossStaff {
    re16\laissezVibrer
  }
  \autoBeamOn
  <fa dod'>16->[ <lab re>(-> <mi' sol>)^\ltoe]\laissezVibrer
  r16 r
  lab,16[ fad,
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  do'
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  re' mib,]
  \autoBeamOff
  \crossStaff {
    la,16\laissezVibrer
  }
  \autoBeamOn
  lab''16[(^\ltoe <fa! fad,> do])\laissezVibrer
  r16 r16
  \autoBeamOff
  \crossStaff {
    <fad,, do'>16\laissezVibrer
  }
  \autoBeamOn
  fa''!16^\ltoe_[( <mib, re'> la])
  r16 r16

  <mib, la>8.[-> <fad do'!>8]
  <mib la fad'>4.
  << { <re fa'!>8[_( <fa si!>8]\ltoe) } \\ { sol4 } >>
  <mib la>16^[\(
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  <fad fa'!>
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  <do' fad>
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  <mib si'>
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  la! re\)]
  %
  fad,,16[\(
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  do'
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  mi!
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  mib'!
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  sib' fa']\)->
  r16 la,,,\laissezVibrer\>[ mib'\laissezVibrer \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  sol\laissezVibrer
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  fad'\laissezVibrer dod'\laissezVibrer\!]
  r8. r8 \clef bass r16
  <<
    {
      s4 <do,,, fad>4\laissezVibrer
      \set stemLeftBeamCount = #0
      \set stemRightBeamCount = #0
      r16[
      % TODO shape beautiful slur.
      %{\shape #'(
                 (0 . -6.8)
                 (0 . -7)
                 (0 . -6)
                 (0 . -1.5)
                 (0 . -1)
                 (0 . 0)
                 ) PhrasingSlur%}
      mib\(\< la dod]\!
      \clef treble
      do'![\> sol' si!]\laissezVibrer\)\!
    } \\
    {
      \stemUp fa,,,,16 ~ fa8[ fa16] ~ fa8[ fa8] ~
      \stemDown fa4\laissezVibrer \stemNeutral
    }
  >>
  r16 r16 r16 \clef bass

  <re'' lab'>16[ <fa si>8] ~ q8
  \clef treble
  \set subdivideBeams = ##t
  si'!16[\laissezVibrer
  fa' ~
  fa dod'] \laissezVibrer
  r16 r r
  \tuplet 3/2 { <re lab>16 <fa si>8 }
}

%<< {  } \\ {  } >>

a = {
  \bar "|" \set Score.currentBarNumber = #1
  \tempo \markup { \small \note #"8." #1 = 3 \note #"16" #1 = 63 ～ 56 (Tempo I) }
  s16*6-\markup{ "in" \dynamic p }
  \bar "|" \set Score.currentBarNumber = #2
  s16*5
  \bar "|" \set Score.currentBarNumber = #3
  s16*5
  \bar "|" \set Score.currentBarNumber = #4
  s16*6\mf
  \bar "|" \set Score.currentBarNumber = #5
  s16*6\p
  \bar "|" \set Score.currentBarNumber = #6
  s16*5
  \bar "|" \set Score.currentBarNumber = #7
  \tempo \markup { \small \note #"8" #1 = 2 \note #"16" #1 = 100 ～ 108 (Tempo II)}
  s16*8-\markup{ "in" \dynamic pp }
  \bar "|" \set Score.currentBarNumber = #8
  s16*7
  \bar "|" \set Score.currentBarNumber = #9
  s16*3
  \bar "|" \set Score.currentBarNumber = #10
  s16*6
  \bar "|" \set Score.currentBarNumber = #11
  s16*3
  \bar "|" \set Score.currentBarNumber = #12
  s16*7\p
  \bar "|" \set Score.currentBarNumber = #13
  s16*5
  \bar "|" \set Score.currentBarNumber = #14
  \tempo \markup { \small Tempo I }
  s16*9\pp
  \bar "|" \set Score.currentBarNumber = #15
  s16*2
  \bar "|" \set Score.currentBarNumber = #16
  s16*9
  \bar "|" \set Score.currentBarNumber = #17
  s16*2
  \bar "|" \set Score.currentBarNumber = #18
  s16*4
  \bar "|" \set Score.currentBarNumber = #19
  s16*2
  \bar "|" \set Score.currentBarNumber = #20
  s16*15
  \bar "|" \set Score.currentBarNumber = #21
  \tempo \markup { \small Tempo II }
  s16*6-\markup { \small "poco" \dynamic mf } \> % TODO align then slent.
  \bar "|" \set Score.currentBarNumber = #22
  s16*6\!\p
  \tempo \markup { \small Tempo I }
  s16*6
  \bar "|" \set Score.currentBarNumber = #23
  s16*7
  \bar "|" \set Score.currentBarNumber = #24
  s16*7
  \bar "|" \set Score.currentBarNumber = #25
  \tempo \markup { \small Tempo II }
  s16*7
  \bar "|" \set Score.currentBarNumber = #26
  \tempo \markup { \small Tempo I }
  s16*3
  \bar "|" \set Score.currentBarNumber = #27
  s16*9\mf
  \bar "|" \set Score.currentBarNumber = #28
  s16*3
  \bar "|" \set Score.currentBarNumber = #29
  s16*9
}

%right = \relative do' { do4\sustainOn do\sustainOff\sustainOn do\sustainPedalHalfOn do\pedalSim do do do do }

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \set PianoStaff.connectArpeggios = ##t
    \override PianoStaff.Arpeggio.stencil = #ly:arpeggio::brew-chord-bracket
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } { \global \right %{\bar "|."%}}
    \new Dynamics = "Dynamics_pf" \a
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \global \left }
  >>
  \layout {
  }
  \midi { }
}

\comments