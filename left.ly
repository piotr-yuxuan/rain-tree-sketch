\version "2.19.16"
\language "italiano"

leftZero = \relative do {
  \clef treble
  <fad do'>16[ re' la'] <do,! re'>16[ fad8]

  % bar n° 2

  << { la16[ sold'^\rtoe] mi8->[ fa,16] } \\ { re8~re8. } >>

  % bar n° 3

  <fad, do'>16[ re'] la'[ do, re']

  % bar n° 4

  << { <red, si'>4. } \\ { la'16[ sold'^\rtoe mi8^\> fa,16^( si\!)] } \\ { s8 mi4 }>>

  % bar n° 5

  si,16[\laissezVibrer fa'\laissezVibrer dod'] ~ dod[ <fa lab>8->\laissezVibrer]

  % bar n° 6

  r8. r8

  % bar n° 7

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

  % bar n° 8

  la16\laissezVibrer[ mib'\laissezVibrer si'] ~ si[ <mib fad>8.]->\laissezVibrer

  % bar n° 9

  r16 r r
}

leftOne = \relative do' {
  % bar n° 10

  sol16[\laissezVibrer dod\laissezVibrer la'\laissezVibrer <dod mi!>8.\ltoe]\laissezVibrer

  % bar n° 11

  r16 r r

  % bar n° 12

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

  % bar n° 13

  r8. r8

  % bar n° 14

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

  % bar n° 15

  r16 r

  % bar n° 16

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

  % bar n° 17

  r16 r16

  % bar n° 18

  \autoBeamOff
  \crossStaff {
    <fad,, do'>16\laissezVibrer
  }
  \autoBeamOn
  fa''!16^\ltoe_[( <mib, re'> la])

  % bar n° 19

  r16 r16
}

leftTwo = \relative do {
  % bar n° 20

  <mib la>8.[-> <fad do'!>8]
  <mib la fad'>4.
  << { <re fa'!>8[_( <fa si!>8]\ltoe) } \\ { sol4 } >>

  % bar n° 21

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

  % bar n° 22

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

  % bar n° 23, 24, 25

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

  % bar n° 26

  r16 r16 r16 \clef bass

  % bar n° 27

  <re'' lab'>16[ <fa si>8] ~ q8
  \clef treble
  \set subdivideBeams = ##t
  si'!16[\laissezVibrer
  fa' ~
  fa dod'] \laissezVibrer
  \clef bass

  % bar n° 28

  r16 r r

  % bar n° 29

  \tuplet 3/2 { <re,,, lab'>16\< <fa si>8\! } % TODO correct triolet
  <la, dod sol'>16[->\> <fad' do'>]\!\laissezVibrer
  s4
}

leftThree = \relative do {
  % bar n° 30

  s8 s8.

  % bar n° 31

  r8 <fad do'>4
  <fa lab sib>8[
  <sib,, fa'! re' lab'>8]

  % bar n° 32

  \autoBeamOff
  \crossStaff {
    \stemUp
    <mib do' lab'>16
    <si! do' fad>8\arpeggioArrowUp % TODO Problem, arpeggio not shown when with an arrow.
    <fa'! sib lab'>8
    <sol do la'!>16
    \stemNeutral
  }
  \autoBeamOn
}

%<< {  } \\ {  } >>


%{
convert-ly (GNU LilyPond) 2.19.16  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16
%}
