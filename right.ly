\version "2.19.16"
\language "italiano"

rha = \relative {
  \voiceOne
  s16 s8 s4 sol''''16[ sib,]\laissezVibrer
}

rhb = \relative {
  <si dod mi>16[ <re mib lab>8]~ q8\laissezVibrer
  \ottava #1
  \voiceTwo
  \once \omit TupletBracket
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

% Figure of dozen. Each ten bars we go to a new block.
rightZero = \relative do'' {

  \voiceOne
  \clef treble
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
}

rightOne = \relative do'' {
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
}

rightTwo = \relative do'' {
% bar n°20

  <do fa>8._[->\> <si dod re>8]\! \bar "!"
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
      r8. <la mi'>16[\laissezVibrer\mf <si red fad>8] ~ <si red fad>8.\laissezVibrer
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
        <sib do! fab sold>16[_>^\>
        <mi! fa! la!>8]\!\laissezVibrer
        <lab lab'>8.\laissezVibrer
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

rightThree = \relative do''' {
  % bar n° 30
  
  r8 <lab lab,>8.^\fermata_\ltoe\laissezVibrer
  
  % bar n° 31
  
  lab,8[ <mi la!>8.\ltoe( <mib lab>16)]
  \bar "!"
  <re sol>8[ <si dod mi>]
  
  % bar n° 32
  
  <re fa! fad la!>16[^\markup{ \italic "poco stringendo" } <la! re fa! lab>8 <si dod mi sol>8 <si dod mi>16]
  
  % bar n° 33
  
  % bar n° 34
}

%<< {  } \\ {  } >>


%{
convert-ly (GNU LilyPond) 2.19.16  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16
%}
