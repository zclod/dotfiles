// this is the style you want to emulate.
// This is the canonical layout file for the Quantum project. If you want to add another keyboard,

#include "atreus.h"
#include "action_layer.h"
#include "eeconfig.h"

#define _______ KC_TRNS

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _MISC 5  //misc
#define _ARR 4  //arrows
#define _SYMBOL 3  //symbols
#define _NUMBERS 2  //numbers
#define _QWERTY 1  //qwerty
#define _COLEMAK 0  //colemak

//tap dance declaration
enum {
  TD_RNB = 0, // ()
  TD_SQB = 1, // []
  TD_CRB = 2, // {}
  TD_ANB = 3  // <>
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
  [TD_ANB]  = ACTION_TAP_DANCE_DOUBLE(KC_LABK, KC_RABK)
};


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	/* Misc
	,----------------------------------.              ,----------------------------------.
	| print|      |  up  |      | volup|              |   f1 |  f2  |  f3  |  f4  |  f5  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|      |  lft |  dn  |  rgt | voldn|              |   f6 |  f7  |  f8  |  f9  | f10  |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|      |  <<  |  ||> |  >>  |      |      ||      |  f11 |  f12 |      |      |      |
	|------+------+------+------+------|      ||      |------+------+------+------+------|
	| reset|      |      |      |      |------'`------|      |      |      |QWERTY|COLEMK|
	`----------------------------------'              `----------------------------------'*/
	
[_MISC] = {
  {KC_PSCR, _______, KC_UP,   _______, KC_VOLU, _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,  KC_F5   },
  {_______, KC_LEFT, KC_DOWN, KC_RGHT, KC_VOLD, _______, KC_F6,   KC_F7,   KC_F8,   KC_F9,  KC_F10  },
  {_______, KC_MPRV, KC_MPLY, KC_MNXT, _______, _______, KC_F11,  KC_F12,  KC_F2,   KC_F3,  KC_F12  },
  {RESET  , _______, _______, _______, _______, _______, _______, _______, _______, QWERTY, COLEMAK }
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
  {_______, _______, _______, _______, _______, _______,              KC_HOME, KC_PGDN, KC_PGUP, KC_END,  _______},
  {_______, _______, _______, _______, _______, _______,              KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, _______},
  {_______, _______, _______, _______, _______, MT(MOD_LSFT, KC_ENT), _______, _______, _______, _______, _______},
  {_______, _______, _______, _______, _______, _______,              _______, _______, _______, _______, _______}
},

	/* symbols
	,----------------------------------.              ,----------------------------------.
	|      |      |      |      |      |              |  ()  |  []  |  {}  |  <>  |   ~  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|      |      |      |      |      |              |   ^  |   $  |   %  |  &   |   `  |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|      |      |      |      |      |      ||      |   ?  |   !  |   @  |  #   |   \  |
	|------+------+------+------+------|      ||      |------+------+------+------+------|
	|      |      |      |      |      |------'`------|      |      |      |      |      |
	`----------------------------------'              `----------------------------------'*/
	
[_SYMBOL] = {
  {_______, _______, _______, _______, _______, _______, TD(TD_RNB), TD(TD_SQB), TD(TD_CRB), TD(TD_ANB), KC_TILD   },
  {_______, _______, _______, _______, _______, _______, KC_CIRC,    KC_DLR,     KC_PERC,    KC_AMPR,    KC_GRV    },
  {_______, _______, _______, _______, _______, _______, KC_QUES,    KC_EXLM,    KC_AT,      KC_HASH,    KC_BSLS   },
  {_______, _______, _______, _______, _______, _______, KC_EXLM,    KC_AT,      KC_HASH,    _______,    _______   }
},

	/* Numbers
	,----------------------------------.              ,----------------------------------.
	|      |      |      |      |      |              |   =  |   7  |   8  |   9  |   +  |
	|------+------+------+------+------|              |------+------+------+------+------|
	|      |      |      |      |      |              |   .  |   4  |   5  |   6  |   -  |
	|------+------+------+------+------|------.,------|------+------+------+------+------|
	|      |      |      |      |      |      ||      |   0  |   1  |   2  |   3  |   *  |
	|------+------+------+------+------|      ||      |------+------+------+------+------|
	|      |      |      |      |      |------'`------|      |      |      |      |   /  |
	`----------------------------------'              `----------------------------------'*/
	
[_NUMBERS] = {
  {_______, _______, _______, _______, _______, _______, KC_EQL,   KC_7,    KC_8,    KC_9,    KC_PLUS},
  {_______, _______, _______, _______, _______, _______, KC_DOT,   KC_4,    KC_5,    KC_6,    KC_MINS},
  {_______, _______, _______, _______, _______, _______, KC_0,     KC_1,    KC_2,    KC_3,    KC_ASTR},
  {_______, _______, _______, _______, _______, _______, _______,  _______, _______, _______, KC_SLSH}
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
  {KC_Q,               KC_W,   LT(_NUMBERS, KC_E), LT(_SYMBOL, KC_R), KC_T,    _______,              KC_Y,    KC_U,    KC_I,    KC_O,    KC_P                 },
  {KC_A,               KC_S,   KC_D,               LT(_ARR, KC_F),    KC_G,    _______,              KC_H,    KC_J,    KC_K,    KC_L,    KC_ASTR              },
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
  {KC_Q,               KC_W,   LT(_NUMBERS, KC_F), LT(_SYMBOL, KC_P), KC_B,    _______,              KC_J,    KC_L,    KC_U,    KC_Y,    KC_ASTR              },
  {KC_A,               KC_R,   KC_S,               LT(_ARR, KC_T),    KC_G,    _______,              KC_K,    KC_N,    KC_E,    KC_I,    KC_O                 },
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
