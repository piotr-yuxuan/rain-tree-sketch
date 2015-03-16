\version "2.19.16"
\language "italiano"

% TODO Vertically aligned dynamics and textscripts

dynamicsZero = {
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
}

dynamicsOne = {
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
}

dynamicsTwo = {
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
  s16*5
  s16*3\p
}

dynamicsThree = {
  \bar "|" \set Score.currentBarNumber = #30
  s16*2
  s16*3\pp
  \bar "|" \set Score.currentBarNumber = #31
  \tempo \markup { \small Tempo II }
  s4.\p s8*2
  \bar "|" \set Score.currentBarNumber = #32
  s8*3-\markup { \italic "cresc." }
  \bar "|" \set Score.currentBarNumber = #33
}


%{
convert-ly (GNU LilyPond) 2.19.16  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16
%}
