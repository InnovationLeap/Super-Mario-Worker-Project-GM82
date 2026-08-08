// raccoon_tail_hit_check()
// Called from o_raccoon_tail Step every frame during its 12-frame sweep.
// Kills enemy by setting rodzajzabicia (4=spin death, 7=shell+kick for koopa types).
// Tail lives for full sweep duration (SMWP2 behavior: one hit per frame, destroy on lifetime).
// Uses self.hit_list (pipe-delimited instance IDs) to prevent double-hitting.
//
// WARNING: ALL enemies inherit from o_goomba. Specific checks MUST come before
// the generic o_goomba catch-all, or they will never be reached.
//
// Immune (skipped): o_kuppa, o_lava, o_kolec, o_mfc, o_lavadier.

if (global.pauza) exit
if (global.level_complete) exit
if (!instance_exists(self)) exit

var _tx, _ty, _victim, _vid;
_tx = self.x
_ty = self.y

// Helper: check if this enemy was already hit this sweep
var _already_hit;
// hit_list is a pipe-delimited string of already-hit instance IDs, initialized in o_raccoon_tail Create

// --- Block interactions (SMWP2: tail hits blocks at foot level) ---
// Hit question blocks / bricks — do NOT exit, allow enemy hits on same frame
if place_meeting(_tx, _ty, o_pointblock) {
    _victim = instance_place(_tx, _ty, o_pointblock);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.bumped = 1
        self.hit_list += _vid + "|"
    }
}
if place_meeting(_tx, _ty, o_pointblock2) {
    _victim = instance_place(_tx, _ty, o_pointblock2);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.bumped = 1
        self.hit_list += _vid + "|"
    }
}

// --- Enemy interactions ---
// IMPORTANT: All specific checks MUST come before o_goomba because ALL enemies
// inherit from o_goomba. o_goomba check is the catch-all at the END.

// === Shell-kick group (rodzajzabicia=7): turtle types become kicked shells ===

if place_meeting(_tx, _ty, o_troopa) {
    _victim = instance_place(_tx, _ty, o_troopa);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopared) {
    _victim = instance_place(_tx, _ty, o_troopared);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopafly) {
    _victim = instance_place(_tx, _ty, o_troopafly);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopaflyred) {
    _victim = instance_place(_tx, _ty, o_troopaflyred);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopablue) {
    _victim = instance_place(_tx, _ty, o_troopablue);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopabluefly) {
    _victim = instance_place(_tx, _ty, o_troopabluefly);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopagold) {
    _victim = instance_place(_tx, _ty, o_troopagold);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}

if place_meeting(_tx, _ty, o_buzzybeetle) {
    _victim = instance_place(_tx, _ty, o_buzzybeetle);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: hardshell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_spiny) {
    _victim = instance_place(_tx, _ty, o_spiny);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: spiny shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_hammerbros) {
    _victim = instance_place(_tx, _ty, o_hammerbros);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_boo) {
    _victim = instance_place(_tx, _ty, o_boo);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_shyguy) {
    _victim = instance_place(_tx, _ty, o_shyguy);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_fahlee) {
    _victim = instance_place(_tx, _ty, o_fahlee);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        // tail: bounce away from tail (does NOT kill grey spiny)
        // horizontal: always fly away from tail hit position
        if _victim.x < _tx { _victim.dir = -abs(_victim.dir); } else { _victim.dir = abs(_victim.dir); }
        _victim.image_xscale = _victim.dir;
        _victim.grav = -8;
        _victim.state = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopaflygold) {
    _victim = instance_place(_tx, _ty, o_troopaflygold);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;   // tail: gold shell + kick
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopashell2) {
    _victim = instance_place(_tx, _ty, o_troopashell2);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.tail_kicked = 1;
        _victim.is_flipped = 1;
        _victim.hurt_delay = 10;
        _victim.grav = -11;
        if _victim.x < o_marker.x { _victim.dir = -1; } else { _victim.dir = 1; }
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopashell) {
    _victim = instance_place(_tx, _ty, o_troopashell);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 7;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_firesister) {
    _victim = instance_place(_tx, _ty, o_firesister);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_lakitu) {
    _victim = instance_place(_tx, _ty, o_lakitu);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_fakitu) {
    _victim = instance_place(_tx, _ty, o_fakitu);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_enemyfire) {
    _victim = instance_place(_tx, _ty, o_enemyfire);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_roto) {
    _victim = instance_place(_tx, _ty, o_roto);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}

// === Cannon/cannonball group (rodzajzabicia=4) ===
if place_meeting(_tx, _ty, o_cannoni) {
    _victim = instance_place(_tx, _ty, o_cannoni);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_cannonig) {
    _victim = instance_place(_tx, _ty, o_cannonig);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}

// === Catch-all: plain goombas (MUST be last — all enemies inherit from o_goomba) ===
if place_meeting(_tx, _ty, o_goomba) {
    _victim = instance_place(_tx, _ty, o_goomba);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.kill_type = 4;
        global.combo1 += 1;
        global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.game_volume); }
        tmp2 = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
