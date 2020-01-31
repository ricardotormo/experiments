# Welcome to Sonic Pi v3.1
# Arpeggio  Ambient

in_thread do
  loop do
    use_octave [0, 1].choose
    6.times do
      play chord(:B3, :major)
      sleep 0.5
    end
    6.times do
      play chord(:Ab3, :minor)
      sleep 0.5
    end
    6.times do
      play chord(:Eb3, :minor)
      sleep 0.5
    end
    6.times do
      play chord(:Gb3, :major)
      sleep 0.5
    end
  end
end

in_thread do
  sleep 24
  loop do
    use_synth [:mod_fm, :prophet, :piano, :pulse].choose
    6.times do
      use_octave 1
      notes = (ring , :eb4, :db4, :b3, :eb4, :Bb3, :db4)
      play notes.tick, amp: 0.3, pan: -1
      sleep  0.5
    end
    6.times do
      use_octave 1
      notes2 = (ring , :db4, :eb4, :eb4, :b3, :db4, :eb4)
      play notes2.tick, amp: 0.3, pan: 1
      sleep  0.5
    end
  end
end


in_thread do
  sleep 12
  loop do
    6.times do
      play :B1
      sleep 0.5
    end
    6.times do
      play :Ab1
      sleep 0.5
    end
    6.times do
      sleep 0.5
    end
    6.times do
      play :Gb1
      sleep 0.5
    end
  end
end

in_thread do
  with_fx :reverb, mix: 0.2 do
    loop do
      2.times do
        use_synth [:dpulse, :fm].choose
        play 87, amp: 0.2
        sleep 0.5
        play 83, amp: 0.3
        sleep 0.5
        play 90, amp: 0.3
        sleep 0.5
      end
      2.times do
        play 87, amp: 0.2
        sleep 0.5
        play 83, amp: 0.2
        sleep 0.5
        play 90, amp: 0.2
        sleep 0.5
      end
      2.times do
        play 87, amp: 0.2
        sleep 0.5
        play 85, amp: 0.2
        sleep 0.5
        play 92, amp: 0.2
        sleep 0.5
      end
      2.times do
        play 80, amp: 0.2
        sleep 0.5
        play 83, amp: 0.2
        sleep 0.5
        play 87, amp: 0.2
        sleep 0.5
      end
    end
  end
end



in_thread do
  sleep 24
  live_loop :drums do
    with_fx :slicer, phase: 0.25, amp: 0.7 do
      synth :noise
      sample :drum_heavy_kick, level: 0.2
      sleep 1
      sample :drum_tom_mid_hard
      sleep 0.5
      sample :drum_heavy_kick
      sleep 0.25
      sample :drum_heavy_kick
      sleep 0.25
      sleep 2
    end
  end
end