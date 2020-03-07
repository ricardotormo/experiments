metro_on = 0 # audible metronom beats
metro_lv = 0.25
use_bpm 70

# a metronom counting and synchronizing bars
# uncomment samples if you need to hear bar and quarter notes
live_loop :bar do
  if metro_on == 1
    sample :elec_blip2, amp: metro_on
    sleep 1
    3.times do
      sample :elec_blip2, amp: metro_on, rate: 2.5
      sleep 1
    end
  else
    sleep 2
  end
end

beat_factor = 1

live_loop :bass_hard, sync: :bar do
  with_fx :reverb, room: 0.5 do
    if spread(4, 4).tick
      sample :drum_bass_hard, amp: 3
    end
  end
  sleep 1
end

live_loop :cymbal_closed, sync: :bar do
  sample :drum_cymbal_closed
  sleep 0.5*beat_factor
end


live_loop :snare, sync: :bar do
  rythm2 = (ring 0.25, 0.25, 0.125, 0.25)
  sleep 3.125
  4.times do
    sample :drum_snare_hard, amp: 1
    sleep rythm2.tick
  end
end

sleep 4
live_loop :inter_rythm, sync: :bar do
  use_synth :tb303
  with_fx :reverb , room: 0.3 do
    4.times do
      notes = (ring :ds3, :ds3, :fs3, :cs4)
      play notes.tick(:notes), amp: 2, release: 0.2, pan: rrand(1, - 1)
      sleep 0.25
    end
    sleep 3
    4.times do
      notes = (ring :ds3, :ds3, :cs3, :fs4)
      play notes.tick(:notes), amp: 2, release: 0.2, pan: rrand(1, - 1)
      sleep 0.25
    end
    sleep 3
    4.times do
      notes = (ring :fs4, :fs4, :as3, :fs5)
      play notes.tick(:notes), amp: 3, release: 0.2, pan: rrand(1, - 1)
      sleep 0.25
    end
    sleep 3
    4.times do
      notes = (ring :fs5, :gs5, :fs6, :as6)
      play notes.tick(:notes), amp: 2, release: 0.2, pan: rrand(1, - 1)
      sleep 0.25
    end
    sleep 3
  end
end

live_loop :dark, sync: :bar do
  stop
  use_synth :dark_ambience
  1.times do
    play :gs4, amp: 22, release: 2
    sleep 2
    play :as4, amp: 22, release: 2
    sleep 2
    play :b4, amp: 22, release: 2
    sleep 2
    play :as4, amp: 22, release: 2
    sleep 2
  end
  1.times do
    play :b5, amp: 12, release: 2
    sleep 2
    play :as5, amp: 12, release: 2
    sleep 2
    play :gs5, amp: 12, release: 2
    sleep 2
    play :ds5, amp: 12, release: 2
    sleep 2
  end
end

live_loop :main_ryhtm_line, sync: :bar do
  with_fx :reverb, room: 0.3 do
    use_synth :piano
    notes = (ring :ds3, :ds3, :ds3, :cs3, :ds3, :ds3, :r)
    s = (ring 0.5, 0.5, 0.5, 0.25, 0.5, 1, 0.75)
    play notes.tick(:notes), amp: 4
    sleep s.tick(:sleep)
  end
end

live_loop :piano_impro, sync: :bar do
  use_synth :piano
  with_fx :reverb, room: 1 do
    with_fx :wobble do
      8.times do
        notes1 = (ring :r, :ds6, :fs6, :gs6)
        s1 = (ring 3.25, 0.25, 0.25, 0.25)
        play notes1.tick(:notes1), amp: 5
        sleep s1.tick(:sleep1)
      end
      4.times do
        notes2 = (ring :r, :as6, :fs6, :ds6)
        s2 = (ring 3.25, 0.25, 0.25, 0.25)
        play notes2.tick(:notes2), amp: 5
        sleep s2.tick(:sleep2)
      end
      16.times do
        notes3 = (ring :r, :as6, :fs6, :ds6, :as6)
        s3 = (ring 0.25, 0.25, 0.25)
        play notes3.choose, amp: 5
        sleep s3.choose
      end
    end
  end
end

sleep 8
live_loop :bass_progression, sync: :bar do
  use_synth :piano
  repeat = 4/0.25
  repeat.times do
    play :ds1, amp: 4
    sleep 0.25
  end
  repeat.times do
    play :fs1, amp: 4
    sleep 0.25
  end
  repeat.times do
    play :gs1, amp: 2
    sleep 0.25
  end
  repeat.times do
    play :ds2, amp: 2
    sleep 0.25
  end
end

live_loop :choir, sync: :bass_progression do
  chords = (ring :as3, :cs4, :ds4, :fs4)
  with_fx :ixi_techno do
    plAmbiChoir(chords.tick, 4, 4)
    sleep 4
  end
end

define :plAmbiChoir do |n,nt,sr|
  #use :rpitch to calculate pitch for required note frequency
  #Natural note is 75.2 found by experiment comparing
  #play 75.2   and     sample :ambi_choir      sounds
  sample :ambi_choir,rpitch: note(n)-75.2,sustain: nt*sr,release: nt*(1-sr),amp: 2
end