# Chord inversion song

use_bpm 70
live_loop :main do
  [1,3,6,4,2,5].each do |d|
    range(-3, 3).each do |i|
      play_chord(chord_degree d, :c, :major, 3, invert: i), amp: 1.5
      sleep 0.5
    end
  end
end

live_loop :drums do
  sync :main
  6.times do |i|
    with_fx :reverb, amp: 0.7, room: 1 do
      sample :bd_haus, amp: 2
      sleep 1
      sample :drum_bass_hard, amp: 2
      sleep 0.5
      sample :drum_bass_hard, amp: 2
      sleep 0.5
      sample :drum_cymbal_closed, amp: 1
      
      if(i % 2 == 0)
        sleep 0.5
        sample :drum_tom_hi_soft, amp: 4
        sleep 0.25
        sample :drum_tom_hi_soft, amp: 4
        sleep 0.25
      else
        sleep 1
      end
    end
  end
end

live_loop :arpeggio do
  sync :main
  notes1 = [:e5, :d5, :c5].ring
  notes2 = [:g4, :f4, :e4].ring
  notes3 = [:c5, :b4, :a4].ring
  notes4 = [:c4, :d4, :e4].ring
  
  with_fx :slicer, amp: 1.5 do
    with_fx :wobble, amp: 0.5 do
      9.times do
        play notes3.tick
        sleep 0.5
      end
      sleep 1.5
      9.times do
        play notes1.tick
        sleep 0.5
      end
      sleep 1.5
      9.times do
        play notes4.tick
        sleep 0.5
      end
      sleep 1.5
      9.times do
        play notes2.tick
        sleep 0.5
      end
    end
  end
end




