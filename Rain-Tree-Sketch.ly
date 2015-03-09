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

% TODO: put LH, RH and bracket hand signs.

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

  \bar "|" \set Score.currentBarNumber = #22

  <fa'! lab>8._[ <mi! la!>8\rtoe-\markup { \center-align \small "poco rall." } <si lab'>16]-> \bar "!"
  <do sol'>4.\laissezVibrer

  \bar "|" \set Score.currentBarNumber = #23

  r8. r8 sol, ~

  \bar "|" \set Score.currentBarNumber = #24

  <dob, mib sol lab>8.[ ~ <dob mib sol lab>16 <fa la! lab>8 <do! fad si re>16]

  \bar "|" \set Score.currentBarNumber = #25

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

  \bar "|" \set Score.currentBarNumber = #26

  r16 r16 r16

  \bar "|" \set Score.currentBarNumber = #27

  <<
    \new Staff \with {
      \remove "Time_signature_engraver"
      alignAboveContext = #"right"
    } {
      r8. <la, mi'>16[\laissezVibrer <si red fad>8] ~ <si red fad>8.\laissezVibrer
    }
    \new Staff \with {
      \remove "Time_signature_engraver"
      alignAboveContext = #"right"
    } {
      r8. <fa, dod'>16[\laissezVibrer sol8] ~ sol8.
    }
    {
      <<
        {
          \stemUp s4.. sol'''16^[ sib,]\laissezVibrer
        } {
          \stemDown
          <si,,, dod mi>16[ <re mib lab>8] ~ <re mib lab>8\laissezVibrer
          \times 2/3 { la'!16[ lab' mi] }
          \override Stem.details.beamed-lengths = #'(2)
          do8
          \stemNeutral
        }
      >>
    }
  >>

  \bar "|" \set Score.currentBarNumber = #28
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
}

%<< {  } \\ {  } >>

dynamics = {
  \tempo \markup { \small \note #"8." #1 = 3 \note #"16" #1 = 63 ～ 56 (Tempo I)}
  s4-\markup{ "in" \dynamic p } s2 s4 s4.\mf s4\p s4..
  \tempo \markup { \small \note #"8" #1 = 2 \note #"16" #1 = 100 ～ 108 (Tempo II)}
  s4.-\markup{ "in" \dynamic pp } s16 s4 s4 s4 s4 s4 s4. s4..\p s8. s8
  \tempo \markup { \small Tempo I}
  s4\pp s2 s s s s4..
  \tempo \markup { \small Tempo II}
  s4.-\markup { "poco" \dynamic mf}\> s4.\!\p
  \tempo \markup { \small Tempo I}
  s2 s2 s4
  \tempo \markup { \small Tempo II}
  s4..
  \tempo \markup { \small Tempo I} % TODO this tempo must be put nearer to r16
  s8. s4\mf
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

sustainPedalHalfOn = {
  \override Staff.SustainPedal #'stencil =
  #(lambda (grob) (grob-interpret-markup grob
                    (markup #:raise 0.1 "½" #:hspace -1 #:musicglyph "pedal.Ped")))
  \override Staff.PianoPedalBracket #'shorten-pair = #'(0.0 . 2.5)
}


pedalSim =
\once \override PianoPedalBracket #'stencil =
#(lambda (grob)
   (let* (;; have we been split?
           (orig (ly:grob-original grob))
           ;; if yes, get the split pieces (our siblings)
           (siblings (if (ly:grob? orig)
                         (ly:spanner-broken-into orig)
                         '())))
     ;; Modify the unbroken grob-stencil or the first part of the broken
     ;; grob-stencil.
     (if (or (null? siblings)
             (and (>= (length siblings) 2)
                  (eq? (car siblings) grob)))
         (let* (;; Get the default-stencil and its x-dimension and x-length.
                 (stil (ly:piano-pedal-bracket::print grob))
                 (stil-x-extent (ly:stencil-extent stil X))
                 (stil-x-length (interval-length stil-x-extent))
                 ;; Create a stencil to be added to the default-stencil.
                 ;; Gets its x-dimension and x-length.
                 (sim-stil
                  (grob-interpret-markup grob
                    (markup #:fontsize -1 #:hspace 1 #:italic "sim.")))
                 (sim-stil-x-extent (ly:stencil-extent sim-stil X))
                 (sim-stil-x-length (interval-length sim-stil-x-extent))
                 (thickness (max (layout-line-thickness grob) 0.1))
                 ;; The value to shorten the default-stencil from the right side.
                 ;; 0.8 will shorten about 80%.
                 ;; Hard-coded, could be turned into a music-function.
                 (amount 0.8))

           ;; Print a warning if the length of the default-stencil would not
           ;; warrant a sufficient output.
           (if (> sim-stil-x-length stil-x-length)
               (ly:warning "PianoPedalBracket is too short"))

           ;; Shorten the default-stencil.
           (ly:grob-set-property!
            grob
            'shorten-pair
            (cons 0 (* amount stil-x-length)))

           ;; Calculate the final stencil.
           (let* (;; Get the shortened (default-)stencil
                   ;; and its y-dimension.
                   (shortened-stil (ly:piano-pedal-bracket::print grob))
                   (shortened-stil-y-ext (ly:stencil-extent shortened-stil Y))
                   ;; Modify the sim-stil to gain a little gap to the left and
                   ;; enlarge it downwards a little (otherwise the stencil-whiteout
                   ;; will not work sufficient.
                   (new-sim-stil
                    (ly:make-stencil
                     (ly:stencil-expr sim-stil)
                     (interval-widen sim-stil-x-extent (* 2 thickness))
                     (cons (- (car shortened-stil-y-ext) thickness)
                       (cdr shortened-stil-y-ext)))))

             (ly:stencil-add
              shortened-stil
              (ly:stencil-translate-axis
               (stencil-whiteout new-sim-stil)
               (* (- 1 amount) (- stil-x-length sim-stil-x-length))
               X))))
         ;; TODO:
         ;; Is there any need to return #f explicitly?
         ;; Deleting it seems to make no difference.
         ;#f
         )))


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
    \new Dynamics = "Dynamics_pf" \dynamics
    \new Staff = "left" \with {
      midiInstrument = "acoustic grand"
    } { \global \left }
  >>
  \layout {
  }
  \midi { }
}
