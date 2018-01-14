#include "atreus.h"
#include "action_layer.h"
#include "eeconfig.h"

#define _______ KC_TRNS
#define ___X___ KC_NO

// Layer list
#define _GAME    6  //gaming layout
#define _MISC    5  //misc
#define _ARR     4  //arrows
#define _SYMBOL  3  //symbols
#define _NUMBERS 2  //numbers
#define _QWERTY  1  //qwerty
#define _COLEMAK 0  //colemak

//tap dance declaration
enum {
  TD_RNB = 0, // ()
  TD_SQB = 1, // []
  TD_CRB = 2, // {}
};

enum planck_keycodes {
  QWERTY = SAFE_RANGE,
  COLEMAK
};

//Tap Dance Definitions
qk_tap_dance_action_t tap_dance_actions[] = {
  [TD_RNB]  = ACTION_TAP_DANCE_DOUBLE(KC_LPRN, KC_RPRN),
  [TD_SQB]  = ACTION_TAP_DANCE_DOUBLE(KC_LBRC, KC_RBRC),
  [TD_CRB]  = ACTION_TAP_DANCE_DOUBLE(KC_LCBR, KC_RCBR),
};


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {


	/* GAMING Layer
	,----------------------------------.              ,----------------------------------.
	|   Q  |   W  |   E  |   R  |   T  |              |   Y  |   U  |   I  |   O  |   P  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|   A  |   S  |   D  |   F  |   G  |              |   H  |   J  |   K  |   L  |  *   |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|   Z  |   X  |   C  |   V  |   B  | Alt  ||      |   N  |   M  |   .  |   ?  |SFT  /|
	|------+------+------+------+------|      ||Enter |------+------+------+------+------|
	|  esc |   2  |   1  |  SFT | CTRL |------'`------| BkSp |  Spc |   ,  |  TAB |      |
	`----------------------------------'              `----------------------------------' */
	
[_GAME] = {
  {KC_Q,   KC_W,   KC_E, KC_R,    KC_T,    ___X___, KC_Y,    KC_U,   KC_I,    KC_O,    KC_P                 },
  {KC_A,   KC_S,   KC_D, KC_F,    KC_G,    ___X___, KC_H,    KC_J,   KC_K,    KC_L,    KC_ASTR              },
  {KC_Z,   KC_X,   KC_C, KC_V,    KC_B,    KC_ENT,  KC_N,    KC_M,   KC_DOT,  KC_QUES, MT(MOD_LSFT, KC_SLSH)},
  {KC_ESC, KC_2,   KC_1, KC_LSFT, KC_LCTL, KC_LALT, KC_BSPC, KC_SPC, KC_COMM, KC_TAB,  _______              }
},


	/* Misc
	,----------------------------------.              ,----------------------------------.
	| print|      |  up  |      | volup|              |   f1 |  f2  |  f3  |  f4  |  f5  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|      |  lft |  dn  |  rgt | voldn|              |   f6 |  f7  |  f8  |  f9  | f10  |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|      |  <<  |  ||> |  >>  |      |      ||      |  f11 |  f12 |      |      |      |
	|------+------+------+------+------|      ||      |------+------+------+------+------|
	| reset|      |      |      |      |------'`------|      |      |QWERTY|COLEMK|_GAME |
	`----------------------------------'              `----------------------------------'*/
	
[_MISC] = {
  {KC_PSCR, ___X___, KC_UP,   ___X___, KC_VOLU, ___X___, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5     },
  {___X___, KC_LEFT, KC_DOWN, KC_RGHT, KC_VOLD, ___X___, KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10    },
  {___X___, KC_MPRV, KC_MPLY, KC_MNXT, ___X___, _______, KC_F11,  KC_F12,  KC_F2,   KC_F3,   KC_F12    },
  {RESET  , ___X___, _______, ___X___, _______, _______, _______, ___X___, QWERTY,  COLEMAK, TG(_GAME) }
},


	/* Arrows
	,----------------------------------.              ,----------------------------------.
	|      |      |      |      |      |              | home |  pdD |  pgU | end  |      |
	|------+------+------+------+------|              |------+------+------+------+------|
	|      |      |      |      |      |              | lft  |  dn  |  up  | rgt  |      |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|      |      |      |      |      |      ||SFT   |      |      |      |      |      |
	|------+------+------+------+------|      ||Enter |------+------+------+------+------|
	|      |      |      |      |      |------'`------|      |      |      |      |      |
	`----------------------------------'              `----------------------------------'*/
	
[_ARR] = {
  {___X___, ___X___, ___X___, ___X___, ___X___, ___X___,              KC_HOME, KC_PGDN, KC_PGUP, KC_END,  ___X___},
  {___X___, ___X___, ___X___, _______, ___X___, ___X___,              KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, ___X___},
  {___X___, ___X___, ___X___, ___X___, ___X___, MT(MOD_LSFT, KC_ENT), ___X___, ___X___, ___X___, ___X___, ___X___},
  {___X___, ___X___, ___X___, ___X___, _______, _______,              _______, ___X___, ___X___, ___X___, ___X___}
},

	/* symbols
	,----------------------------------.              ,----------------------------------.
	|      |      |      |      |      |              |   `  |  ()  |  []  |  {}  |   ~  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|      |      |      |      |      |              |   ^  |   $  |   %  |  &   |   |  |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|      |      |      |      |      |      ||      |   ?  |   !  |   @  |  #   |   \  |
	|------+------+------+------+------|      ||      |------+------+------+------+------|
	|      |      |      |      |      |------'`------|      |   =  |   <  |   >  |   -  |
	`----------------------------------'              `----------------------------------'*/
	
[_SYMBOL] = {
  {___X___, ___X___, ___X___, _______, ___X___, ___X___, KC_GRV,     TD(TD_RNB), TD(TD_SQB), TD(TD_CRB), KC_TILD   },
  {___X___, ___X___, ___X___, ___X___, ___X___, ___X___, KC_CIRC,    KC_DLR,     KC_PERC,    KC_AMPR,    KC_PIPE   },
  {___X___, ___X___, ___X___, ___X___, ___X___, _______, KC_QUES,    KC_EXLM,    KC_AT,      KC_HASH,    KC_BSLS   },
  {___X___, ___X___, ___X___, ___X___, _______, _______, _______,    KC_EQL,     KC_LABK,    KC_RABK,    KC_MINS   }
},

	/* Numbers
	,----------------------------------.              ,----------------------------------.
	|      |      |      |      |      |              |   <  |   7  |   8  |   9  |   >  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|      |      |      |      |      |              |   +  |   4  |   5  |   6  |   *  |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|      |      |      |      |      |      ||      |   -  |   1  |   2  |   3  |   /  |
	|------+------+------+------+------|      ||      |------+------+------+------+------|
	|      |      |      |      |      |------'`------|      |   0  |   .  |   =  |      |
	`----------------------------------'              `----------------------------------'*/
	
[_NUMBERS] = {
  {___X___, ___X___, _______, ___X___, ___X___, ___X___, KC_LABK,  KC_7,    KC_8,    KC_9,    KC_RABK},
  {___X___, ___X___, ___X___, ___X___, ___X___, ___X___, KC_PLUS,  KC_4,    KC_5,    KC_6,    KC_ASTR},
  {___X___, ___X___, ___X___, ___X___, ___X___, _______, KC_MINS,  KC_1,    KC_2,    KC_3,    KC_SLSH},
  {___X___, ___X___, ___X___, ___X___, _______, _______, _______,  KC_0,    KC_DOT,  KC_EQL,  ___X___}
},

	/* QWERTY Layer
	,----------------------------------.              ,----------------------------------.
	|   Q  |   W  |   E  |   R  |   T  |              |   Y  |   U  |   I  |   O  |   P  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|   A  |   S  |   D  |   F  |   G  |              |   H  |   J  |   K  |   L  |  *   |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|SFT  Z|   X  |   C  |   V  |   B  | CTRL ||Alt   |   N  |   M  |   .  |   '  |SFT  /|
	|------+------+------+------+------|  TAB ||Enter |------+------+------+------+------|
	|  esc |  del |_MISC |  GUI | BkSp |------'`------|  Spc |   ,  |   ;  |   -  |   +  |
	`----------------------------------'              `----------------------------------' */
	
[_QWERTY] = {
  {KC_Q,               KC_W,   LT(_NUMBERS, KC_E), LT(_SYMBOL, KC_R), KC_T,    ___X___,              KC_Y,    KC_U,    KC_I,    KC_O,    KC_P                 },
  {KC_A,               KC_S,   KC_D,               LT(_ARR, KC_F),    KC_G,    ___X___,              KC_H,    KC_J,    KC_K,    KC_L,    KC_ASTR              },
  {MT(MOD_LSFT, KC_Z), KC_X,   KC_C,               KC_V,              KC_B,    MT(MOD_LALT, KC_ENT), KC_N,    KC_M,    KC_DOT,  KC_QUOT, MT(MOD_LSFT, KC_SLSH)},
  {KC_ESC,             KC_DEL, TT(_MISC),          KC_LGUI,           KC_BSPC, MT(MOD_LCTL, KC_TAB), KC_SPC,  KC_COMM, KC_SCLN, KC_MINS, KC_PLUS              }
},

	/* Colemak Layer (Mod DH)
	,----------------------------------.              ,----------------------------------.
	|   Q  |   W  |   F  |   P  |   B  |              |   J  |   L  |   U  |   Y  |  *   |
	|------+------+------+------+------|              |------+------+------+------+------|
	|   A  |   R  |   S  |   T  |   G  |              |   K  |   N  |   E  |   I  |  O   |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|SFT  Z|   X  |   C  |   D  |   V  | CTRL ||Alt   |   M  |   H  |   .  |   '  |SFT  /|
	|------+------+------+------+------|  TAB ||Enter |------+------+------+------+------|
	|  esc |  del |_MISC |  GUI | BkSp |------'`------|  Spc |   ,  |   ;  |   -  |   +  |
	`----------------------------------'              `----------------------------------'*/
	
[_COLEMAK] = {
  {KC_Q,               KC_W,   LT(_NUMBERS, KC_F), LT(_SYMBOL, KC_P), KC_B,    ___X___,              KC_J,    KC_L,    KC_U,    KC_Y,    KC_ASTR              },
  {KC_A,               KC_R,   KC_S,               LT(_ARR, KC_T),    KC_G,    ___X___,              KC_K,    KC_N,    KC_E,    KC_I,    KC_O                 },
  {MT(MOD_LSFT, KC_Z), KC_X,   KC_C,               KC_D,              KC_V,    MT(MOD_LALT, KC_ENT), KC_M,    KC_H,    KC_DOT,  KC_QUOT, MT(MOD_LSFT, KC_SLSH)},
  {KC_ESC,             KC_DEL, TT(_MISC),          KC_LGUI,           KC_BSPC, MT(MOD_LCTL, KC_TAB), KC_SPC,  KC_COMM, KC_SCLN, KC_MINS, KC_PLUS              }
}
};

const uint16_t PROGMEM fn_actions[] = {

};

void persistent_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}

/* bool process_record_user(uint16_t keycode, keyrecord_t *record); */
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
        case QWERTY:
          if (record->event.pressed) {
            persistent_default_layer_set(1UL<<_QWERTY);
          }
          return false;
          break;
        case COLEMAK:
          if (record->event.pressed) {
            persistent_default_layer_set(1UL<<_COLEMAK);
          }
          return false;
          break;
      }
    return true;
};
