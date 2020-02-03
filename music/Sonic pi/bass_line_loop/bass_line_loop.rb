# Bass Line loop


use_bpm 200
live_loop :drums do
  sample :drum_heavy_kick, amp: 3
  sleep 2
end


live_loop :drums2 do
  sync :drums
  sleep 2.5
  sample :drum_cymbal_pedal
end

live_loop :snare do
  sleep 2
  sync :drums
  with_fx :reverb, room: 0.4 do
    sample :drum_snare_hard, amp: 0.4
  end
end

live_loop :bass do
  sync :drums
  sleep 1
  play :A2, amp: 4
  sleep 0.5
  play :B2, amp: 2
  sleep 1
  play :D2, amp: 2
  sleep 1
  play :E2, amp: 4
  sleep 4
end

live_loop :bass_up do
  sync :bass
  sleep 5
  play :B2, amp: 2
  sleep 1.45
  play :D3, amp: 2
  sleep 1.05
  play :E3, amp: 2
  sleep 0.5
end