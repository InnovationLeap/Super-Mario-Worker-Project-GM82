// raccoon_tail_hit_check()
// Called from o_raccoon_tail Step every frame during its 12-frame sweep.
// Kills enemy by setting rodzajzabicia (1=shell for koopa, 4=spin for others).
// Tail lives for full sweep duration (SMWP2 behavior: one hit per frame, destroy on lifetime).
// Uses self.hit_list (pipe-delimited instance IDs) to prevent double-hitting.
//
// Immune (skipped): o_kuppa, o_lava, o_kolec, o_mfc, o_lavadier.

if (global.pauza) exit
if (global.etappokonany) exit
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
        _victim.podbity = 1
        self.hit_list += _vid + "|"
    }
}
if place_meeting(_tx, _ty, o_pointblock2) {
    _victim = instance_place(_tx, _ty, o_pointblock2);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.podbity = 1
        self.hit_list += _vid + "|"
    }
}

// --- Enemy interactions ---

if place_meeting(_tx, _ty, o_goomba) {
    _victim = instance_place(_tx, _ty, o_goomba);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1;
        global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}

if place_meeting(_tx, _ty, o_troopa) {
    _victim = instance_place(_tx, _ty, o_troopa);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopared) {
    _victim = instance_place(_tx, _ty, o_troopared);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopafly) {
    _victim = instance_place(_tx, _ty, o_troopafly);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopaflyred) {
    _victim = instance_place(_tx, _ty, o_troopaflyred);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopablue) {
    _victim = instance_place(_tx, _ty, o_troopablue);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopabluefly) {
    _victim = instance_place(_tx, _ty, o_troopabluefly);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_troopagold) {
    _victim = instance_place(_tx, _ty, o_troopagold);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 1;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}

if place_meeting(_tx, _ty, o_buzzybeetle) {
    _victim = instance_place(_tx, _ty, o_buzzybeetle);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_kolcozwierz) {
    _victim = instance_place(_tx, _ty, o_kolcozwierz);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_hammerbros) {
    _victim = instance_place(_tx, _ty, o_hammerbros);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_boo) {
    _victim = instance_place(_tx, _ty, o_boo);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_shyguy) {
    _victim = instance_place(_tx, _ty, o_shyguy);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_fahlee) {
    _victim = instance_place(_tx, _ty, o_fahlee);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_firesister) {
    _victim = instance_place(_tx, _ty, o_firesister);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_lakitu) {
    _victim = instance_place(_tx, _ty, o_lakitu);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_fakitu) {
    _victim = instance_place(_tx, _ty, o_fakitu);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_enemyfire) {
    _victim = instance_place(_tx, _ty, o_enemyfire);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
if place_meeting(_tx, _ty, o_wiatrak) {
    _victim = instance_place(_tx, _ty, o_wiatrak);
    _vid = string(_victim.id);
    _already_hit = (string_pos(_vid, self.hit_list) > 0);
    if !_already_hit {
        _victim.rodzajzabicia = 4;
        global.combo1 += 1; global.combo1reset = 0;
        self.hit_list += _vid + "|"
        if global.sample = 1 { sound_play(snd_kick); sound_volume(snd_kick, global.glosnosc); }
        fofo = instance_create(_tx, _ty, o_kickeffect)
    }
    exit
}
