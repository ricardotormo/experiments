#Part I
#Space

live_loop :space do
  use_synth :tb303
  with_fx :reverb , room: 1 do
    1.times do
      play chord(:ab3, :min), amp: 4 , release: 3, pan: rrand(-1, 1)
      sleep 4
    end
    1.times do
      play chord(:gb3, :major), amp: 4 , release: 3
      sleep 4
    end
    1.times do
      play chord(:fb3, :maj9), amp: 4 , release: 3, pan: rrand(-1, 1)
      sleep 4
    end
    1.times do
      play chord(:eb3, :m7), amp: 4 , release: 3
      sleep 4
    end
  end
end


live_loop :a, sync: :space do
  stop
  with_fx :reverb, room: 1 do
    use_synth :blade
    7.times do
      notes = (ring :ab4, :ab4, :ab4, :b4, :eb5, :eb5, :r)
      s = (ring 0.5, 0.5, 0.5, 0.25, 0.5, 1, 0.75)
      play notes.tick(:notes), amp: 2.5
      sleep s.tick(:sleep)
    end
    7.times do
      notes = (ring :gb4, :gb4, :gb4, :bb4, :db5, :ab5, :r)
      s = (ring 0.5, 0.5, 0.5, 0.25, 0.5, 1, 0.75)
      play notes.tick(:notes), amp: 2.5
      sleep s.tick(:sleep)
    end
    7.times do
      notes = (ring :gb4, :gb4, :gb4, :ab4, :bb5, :db5, :r)
      s = (ring 0.5, 0.5, 0.5, 0.25, 0.5, 1, 0.75)
      play notes.tick(:notes), amp: 2.5
      sleep s.tick(:sleep)
    end
    7.times do
      notes = (ring :gb4, :gb4, :gb4, :db4, :b4, :db5, :r)
      s = (ring 0.5, 0.5, 0.5, 0.25, 0.5, 1, 0.75)
      play notes.tick(:notes), amp: 2.5
      sleep s.tick(:sleep)
    end
  end
end

live_loop :s, sync: :space do
  use_synth :blade
  with_fx :reverb , room: 1 do
    play :ab4, amp: 4
    sleep 1
    play :b4, amp: 4
    sleep 1
    play :eb5, amp: 4
    sleep 2
  end
end

live_loop :z, sync: :space do
  use_synth :supersaw
  with_fx :reverb, room: 1 do
    1.times do
      play :eb5, amp: 2
      sleep 1
      play :e5, amp: 2
      sleep 1
      play :b4, amp: 2
      sleep 2
    end
    1.times do
      play :eb5, amp: 2
      sleep 1
      play :e5, amp: 2
      sleep 1
      play :bb4, amp: 2
      sleep 2
    end
    1.times do
      play :db5, amp: 2
      sleep 1
      play :b4, amp: 2
      sleep 1
      play :ab4, amp: 2
      sleep 2
    end
    1.times do
      play :bb4, amp: 2
      sleep 1
      play :b4, amp: 2
      sleep 1
      play :db5, amp: 2
      sleep 2
    end
  end
end

live_loop :bass2, sync: :space do
  with_fx :reverb , room: 1 do
    2.times do
      pitch_bass(:ab2, 4, 4, 8)
      sleep 0.5
      pitch_bass(:b2, 4, 4, 8)
      sleep 0.5
      pitch_bass(:db3, 4, 4, 8)
      sleep 0.5
      pitch_bass(:eb3, 4, 4, 8)
      sleep 0.5
    end
    4.times do
      pitch_bass(:gb2, 4, 4, 8)
      sleep 0.5
      pitch_bass(:bb2, 4, 4, 8)
      sleep 0.5
    end
  end
end

live_loop :beat , sync: :space do
  sample :drum_cymbal_closed, amp: 4
  sleep 1
  sample :drum_cymbal_closed, amp: 3
  sleep 0.5
  sample :drum_snare_hard, amp: 3
  sleep 0.5
end

live_loop :beat4 , sync: :space do
  sleep 3.25
  with_fx :reverb, room: 1 do
    sample :drum_bass_hard, amp: 4
    sleep 0.25
    sample :bd_haus, amp: 4
    sleep 0.25
    sample :bd_haus, amp: 4
    sleep 0.25
  end
end

live_loop :bass, sync: :space do
  with_fx :reverb , room: 1 do
    16.times do
      play :ab2, amp: 2
      sleep 0.25
    end
    16.times do
      play :gb2, amp: 2
      sleep 0.25
    end
  end
end
live_loop :final_acc, sync: :space do
  
  use_synth :piano
  with_fx :reverb, room: 1 do
    1.times do
      pitch_horn(:eb5, 4, 4, 8)
      play :eb6, release: 3, amp: 4
      sleep 3
      play :eb5, release: 3, amp: 4
      play :db6, release: 3, amp: 4
      sleep 0.5
      play :eb5, release: 3, amp: 4
      play :e6, release: 3, amp: 4
      sleep 0.5
    end
    1.times do
      play :eb5, release: 3, amp: 4
      play :db6, release: 3, amp: 4
      sleep 3
      play :eb5, release: 3, amp: 4
      play :db6, release: 3, amp: 4
      sleep 0.5
      play :eb5, release: 3, amp: 4
      play :eb6, release: 3, amp: 4
      sleep 0.5
    end
    1.times do
      play :eb5, release: 3, amp: 4
      play :b5, release: 3, amp: 4
      sleep 3
      play :eb5, release: 3, amp: 4
      play :b5, release: 3, amp: 4
      sleep 0.5
      play :eb5, release: 3, amp: 4
      play :db6, release: 3, amp: 4
      sleep 0.5
    end
    1.times do
      play :eb5, release: 4, amp: 4
      play :bb5, release: 4, amp: 4
      sleep 4
    end
  end
end



samples  = "put your sample here"

define :pitch_horn do |n, nt, sr, amp|
  sample samples, "french" , rpitch: note(n) - 44.8, sustain: nt*sr,release: nt*(1-sr), amp: amp
end

define :pitch_bass do |n, nt, sr, amp|
  #use :rpitch to calculate pitch for required note frequency
  #Natural note is 35.7 found by experiment comparing
  sample samples, "bass_zgump" , rpitch: note(n) - 35.7 , sustain: nt*sr,release: nt*(1-sr), amp: amp
end

#Part II
#Epic
live_loop :space do
  use_synth :tb303
  with_fx :reverb , room: 1 do
    1.times do
      play chord(:ab3, :min), amp: 4 , release: 3, pan: rrand(-1, 1)
      sleep 4
    end
    1.times do
      play chord(:gb3, :major), amp: 4 , release: 3
      sleep 4
    end
    1.times do
      play chord(:fb3, :maj9), amp: 4 , release: 3, pan: rrand(-1, 1)
      sleep 4
    end
    1.times do
      play chord(:eb3, :m7), amp: 4 , release: 3
      sleep 4
    end
  end
end
live_loop :epic, sync: :space do
  with_fx :reverb, room: 1 do
    4.times do
      pitch_horn(:eb1, 4, 4, 8)
      pitch_horn(:ab2, 4, 4, 8)
      pitch_horn(:eb2, 4, 4, 8)
      sleep 1
    end
    4.times do
      pitch_horn(:eb2, 4, 4, 8)
      pitch_horn(:db2, 4, 4, 8)
      pitch_horn(:bb2, 4, 4, 8)
      sleep 1
    end
    4.times do
      pitch_horn(:eb2, 4, 4, 8)
      pitch_horn(:db2, 4, 4, 8)
      pitch_horn(:b2, 4, 4, 8)
      sleep 1
    end
    4.times do
      pitch_horn(:gb2, 4, 4, 8)
      pitch_horn(:bb2, 4, 4, 8)
      pitch_horn(:db3, 4, 4, 8)
      sleep 1
    end
  end
end

live_loop :choir, sync: :epic do
  stop
  with_fx :echo, phase: 1 do
    play :Db4
    play :E4
    play :Ab4
    play :Bb4
    sleep 4
  end
end

live_loop :beat_epic_cymbal_open, sync: :epic do
  sample :drum_cymbal_open, amp: 1
  sleep 4
end

live_loop :beat_epic_bd, sync: :epic do
  sample :bd_haus, amp: 5
  sleep 1
end

live_loop :beat_epic_bd_closed, sync: :epic do
  sample :drum_cymbal_closed, amp: 7
  sleep 0.5
end

live_loop :arpbass, sync: :epic do
  with_fx :reverb, room: 1 do
    2.times do
      play :a2
      pitch_bass(:eb2, 4, 4, 8)
      sleep 1
      pitch_bass(:ab2, 4, 4, 8)
      sleep 1
    end
    2.times do
      pitch_bass(:db2, 4, 4, 8)
      sleep 1
      pitch_bass(:ab2, 4, 4, 8)
      sleep 1
    end
  end
end

live_loop :acomp, sync: :epic  do
  16.times do
    pitch_horn(:cb4, 4, 4, 8)
    sleep 0.25
  end
  16.times do
    pitch_horn(:db4, 4, 4, 8)
    sleep 0.25
  end
  16.times do
    pitch_horn(:gb4, 4, 4, 8)
    sleep 0.25
  end
  16.times do
    pitch_horn(:ab4, 4, 4, 8)
    sleep 0.25
  end
end

live_loop :bass_epic, sync: :epic do
  with_fx :reverb, room: 1 do
    8.times do
      play :ab2, amp: 4
      sleep 0.5
    end
    8.times do
      play :bb2, amp: 4
      sleep 0.5
    end
    8.times do
      play :b2, amp: 4
      sleep 0.5
    end
    8.times do
      play :db3, amp: 4
      sleep 0.5
    end
  end
end

live_loop :acc, sync: :epic do
  stop
  use_synth :piano
  5.times do
    s = (ring 1, 0.5, 0.5, 1, 1)
    notes = (ring :ab4, :ab4, :ab4, :g4, :bb4)
    play notes.tick(:notes), amp: 4
    sleep s.tick(:sleep)
  end
  5.times do
    s = (ring 1, 0.5, 0.5, 1, 1)
    notes = (ring :bb4, :bb4, :bb4, :ab4, :b4)
    play notes.tick(:notes), amp: 4
    sleep s.tick(:sleep2)
  end
  5.times do
    s = (ring 1, 0.5, 0.5, 1, 1)
    notes = (ring :b4, :b4, :b4, :bb4, :db5)
    play notes.tick(:notes), amp: 4
    sleep s.tick(:sleep2)
  end
  5.times do
    s = (ring 0.5, 0.5, 0.5, 0.5, 2)
    notes = (ring :db5, :eb5, :e5, :gb5, :eb5)
    play notes.tick(:notes), amp: 4
    sleep s.tick(:sleep)
  end
end
