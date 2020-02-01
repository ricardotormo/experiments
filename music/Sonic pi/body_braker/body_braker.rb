#Body breaker

use_bpm 90
rythm = [0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5].ring

live_loop :melody do
  notes = [:b2, :d3, :e3, :e3, :e3, :d3, :e3, :d3].ring
  use_synth :tb303
  play notes.look, cutoff: rrand(70, 100), amp: 0.3, release: 0.3
  sleep rythm.tick
end


live_loop :bass do
  sync :drums
  use_synth :tb303
  sleep 1.5
  play :e2, sustain: 0.5, release: 0.4, amp: 0.3, cutoff: 60
  sleep 2
  play :g2, sustain: 0.5, release: 0.7,  amp: 0.3, cutoff: 80
  sleep 2
  play :a2, sustain: 0.9, release: 0.4,  amp: 0.3, cutoff: 60
  sleep 2
  play :b2, sustain: 1, release: 0.4,  amp: 0.3, cutoff: 90
end

live_loop :ambient do
  sync :bass
  with_fx :wobble, mix: 1 do
    use_synth :tb303
    sleep 1
    play :d3, sustain: 0.5, release: 0.4, amp: 0.25, cutoff: 120
    sleep 2
    play :a3, sustain: 0.5, release: 0.7,  amp: 0.25, cutoff: 120
    sleep 2
    play :g3, sustain: 0.9, release: 0.4,  amp: 0.25, cutoff: 120
    sleep 2
    play :b3, sustain: 1, release: 0.4,  amp: 0.25, cutoff: 120
  end
end

live_loop :drums do
  sample :drum_bass_soft,  amp: 4
  sleep 0.5
  sample :bd_haus,  amp: 2
  sleep 0.5
  sample :drum_cymbal_pedal,  amp: 1
end



