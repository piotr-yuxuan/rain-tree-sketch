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

% There is three kind of accents: \rtoe, \ltoe and -> to keep the glyph similar.
% I want to print bar number.

global = {
  \set Score.timing = ##f % Remove time counting, so measure bar needs to be explicitly stated.
  \accidentalStyle Score.forget % modern-cautionary or forget
  % I'd like to make laissezVibrer wider but this snippet doesn't work :/
  % http://www.lilypond.org/doc/v2.18/Documentation/snippets/expressive-marks#expressive-marks-laissez-vibrer-ties
}

% We choose to deal with measure bars with the right voice. We could have added a dynamics staff but this seems to be the easiest solution. So while the the score is being written, it means the right hand needs to keep more up to date than the left one or at least equal.
right = \relative do'' {
  \voiceOne
  % Clef is a property of the voice because it changes more often than usual.
  \clef treble
  \set Score.currentBarNumber = #1
  <sold fa'! la>8_[ <sib' sold'>16] <dod mi>8->_[ fa,16^\rtoe]

  \bar "|" \set Score.currentBarNumber = #2

  si16_[( sib']) sol_[ si,8]^\ltoe

  \bar "|" \set Score.currentBarNumber = #3

  <sold, fa' la>16_[ <sib' sold'>16] <dod mi>8_[( fa,16])

  \bar "|" \set Score.currentBarNumber = #4

  <mi' sold>16_[ <re sol>8->(^\> <si fa'>16) mib16( dod)]\!

  \bar "|" \set Score.currentBarNumber = #5

  << { la16[( sold'->) mi\rtoe] ~ mi8[ si!16]\laissezVibrer } \\ { sol8[ sib16]~ sib8[ sol16\laissezVibrer] } >>

  \bar "|" \set Score.currentBarNumber = #6

  r8. r8

  \bar "|" \set Score.currentBarNumber = #7

  <lab fa' sib>16[( <sib mi la>]) si![(
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  sol'!)
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  fa mib dod8\laissezVibrer] \mark \markup {\normalsize "l.v"}

  \bar "|" \set Score.currentBarNumber = #8

  << { sol16[( fad')\ltoe re->] ~ re8[ la!]\laissezVibrer } \\ { fa8[ lab16] ~ lab8[ fa!]\laissezVibrer } >>

  \bar "|" \set Score.currentBarNumber = #9

  r8 r r

  \bar "|" \set Score.currentBarNumber = #10

  << { fa16[( mi'!)-> do] ~ do[ sol8]\laissezVibrer } \\ { mib8[ fad16] ~ fad[ mib8]\laissezVibrer } >>

  \bar "|" \set Score.currentBarNumber = #11

  r8 r r

  \bar "|" \set Score.currentBarNumber = #12

  sol16[ lab( mi')] si16[ <sol' sib>8(->^\markup{ \tiny "(si)"} <mi dod'>16])^\ltoe^\markup{ \tiny "(do)"}\laissezVibrer

  \bar "|" \set Score.currentBarNumber = #13

  r8. r8

  \bar "|" \set Score.currentBarNumber = #14

  \ottava #1
  fa'16[ mi
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
  <si''! re>16->[ <do, la'!>->( <fa lab>)]\ltoe\laissezVibrer

  \bar "|" \set Score.currentBarNumber = #15
  r16 r

  \bar "|" \set Score.currentBarNumber = #16

  <do' mib>16[ <la re>
  \set stemLeftBeamCount = #2
  \set stemRightBeamCount = #1
  <fad si>
  \set stemLeftBeamCount = #1
  \set stemRightBeamCount = #2
  fad fa!] \bar "!"
  \ottava #0
  <dod, fad>16\laissezVibrer \bar "!"
  do'8(_[\ltoe si16)]\laissezVibrer

  \bar "|" \set Score.currentBarNumber = #17

  r16 r

  \bar "|" \set Score.currentBarNumber = #18

  mib,16\laissezVibrer \bar "!"
  la8\ltoe_[( sold16])

  \bar "|" \set Score.currentBarNumber = #19

  r16 r16

  \bar "|" \set Score.currentBarNumber = #20

  <do, fa>8.[->\> <si dod re>8]\! \bar "!"
  <re fa!>8[ <dod fad>8.->( <do! fa!>16]) \bar "!"
  <si mi>8[( <sold sib dod>8])\ltoe

  \bar "|" \set Score.currentBarNumber = #21

  <fad sol si>16[\(
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
}

%<< {  } \\ {  } >>

left = \relative do {
  \clef treble
  %do''1 do2 do4 do8 do16 dobb32 do64 do128 do1 do2 do4 do8 do16 do32 do64 do128
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
  r8 r r
  sol,,16[\laissezVibrer dod\laissezVibrer la'\laissezVibrer <dod mi!>8.\ltoe]\laissezVibrer
  r8 r r
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
}

%<< {  } \\ {  } >>

dynamics = {
  \tempo \markup { \small \note #"8." #1 = 3 \note #"16" #1 = 63 ～ 56 (Tempo I)}
  s4-\markup{ "in" \dynamic p } s2 s4 s4.\mf s4\p s4..
  \tempo \markup { \small \note #"8" #1 = 2 \note #"16" #1 = 100 ～ 108 (Tempo II)}
  s4.-\markup{ "in" \dynamic pp } s16 s4 s4 s4 s4 s4 s4. s4..\p s8. s8
  \tempo \markup { \small Tempo I}
  s4\pp
}

\markuplist {
  \vspace #1
  \justified-lines {
    Rain Tree Sketch for piano was premiered by Kazuoki Fujii in Tokyo on Januart 14, 1983.
  }
  \vspace #1
  \justified-lines {
    Duration: 3 minutes
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

\score {
  \new PianoStaff \with {
    instrumentName = "Piano"
  } <<
    \set PianoStaff.connectArpeggios = ##t
    \override PianoStaff.Arpeggio.stencil = #ly:arpeggio::brew-chord-bracket
    \new Staff = "right" \with {
      midiInstrument = "acoustic grand"
    } { \global \right %{\bar "|."%}}
    \new Dynamics = "Dynamics_pf" \dynamics
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \global \left }
  >>
  \layout {
  }
  \midi { }
}
