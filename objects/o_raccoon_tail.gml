#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Raccoon Mario's tail attack projectile with position interpolation.
// Sweep trajectory mirrors SMWP2's AnimationPlayer keyframes:
//   timer 0-2:  offsetX=0        (brief hold)
//   timer 2-4:  offsetX=0→+20   (forward swing)
//   timer 4-7:  offsetX=+20→-20 (backward sweep)
//   timer 7-12: offsetX=-20→0   (return to center)
// Total lifetime: 12 frames @30fps ≈ 400ms (matches SMWP2)

kierunek = 0
timer = 0
lifetime = 12
image_speed = 0
hit_list = ""  // Pipe-delimited list of already-hit instance IDs

// 发光位置微调
light_x = 0;
light_y = 0;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {

    // Auto-destroy if player changed to a different powerup
    if !instance_exists(o_marker) || o_marker.rodzajmaria_is_raccoon = 0 {
        instance_destroy()
        exit
    }

    // Calculate sweep X offset based on SMWP2 AnimationPlayer keyframes
    // _dir = 1 for right, -1 for left
    var _dir, _sweepX;
    _dir = 1
    if kierunek = 1 { _dir = -1 }

    if timer <= 2 {
        _sweepX = 0
    } else {
        if timer <= 4 {
            // Forward swing: 0 → 20, linear over 2 frames
            _sweepX = (timer - 2) / 2 * 20 * _dir
        } else {
            if timer <= 7 {
                // Backward sweep: 20 → -20, linear over 3 frames
                _sweepX = (20 - (timer - 4) / 3 * 40) * _dir
            } else {
                // Return to center: -20 → 0, linear over 5 frames
                _sweepX = (-20 + (timer - 7) / 5 * 20) * _dir
            }
        }
    }

    // Update position: SMWP2 — tail at player's bottom, offset when falling
    if instance_exists(o_marker) {
        var _px, _py, _tailY;
        _px = o_marker.x
        _py = o_marker.y

        // Y position: align tail bottom with player bottom (SMWP2: both at collision bottom=12)
        // Player: origin_y=65, bbox_bottom=65 → player bottom = _py
        // Tail:   origin_y=12, bbox_bottom=23 → tail bottom = _tailY + 11
        // To align: _tailY + 11 = _py → _tailY = _py - 11
        _tailY = _py - 11

        // SMWP2: when falling and no ground imminently below, offset down by fall speed
        // This prevents tail-stomping enemies while falling through open air
        if o_marker.grawitacja > 0 {
            var _checkY;
            _checkY = _py + o_marker.grawitacja + 1
            if !place_meeting(_px, _checkY, obj_wall) && !place_meeting(_px, _checkY, o_pointblock) && !place_meeting(_px, _checkY, o_windas) {
                _tailY = _py - 11 + o_marker.grawitacja
            }
        }

        // X: tail at player center (SMWP2: tail.Position = Vector2.Zero, no lateral offset)
        x = _px + _sweepX
        y = _tailY

        // Flip sprite based on direction
        if _dir = 1 { image_xscale = -1 }
        if _dir = -1 { image_xscale = 1 }
    }

    // Animate sprite
    image_index += 0.4

    // Collision check every frame (sweep hits different positions each frame)
    raccoon_tail_hit_check()

    // Lifetime auto-destroy
    timer += 1
    if timer > lifetime { instance_destroy(); exit }

}
