var currentMode = null
  , keys = {}

var shift = ['shift']
  , ctrl = ['ctrl']
  , hyper = ['cmd', 'shift', 'ctrl', 'alt']

api.bind('space', ['cmd', 'shift'], setMode('normal'))

bind('normal', 'escape', [], setMode('insert'))

bind('insert', 't', hyper, toWindow('iTerm'))
bind('insert', 's', hyper, toWindow('Slack'))
bind('insert', 'c', hyper, toWindow('Google Chrome'))
bind('insert', 'x', hyper, toWindow('Textual 5'))
bind('insert', 'p', hyper, toWindow('1Password'))

bind('normal', 'l', ctrl, rightHalf)
bind('normal', 'h', ctrl, leftHalf)
bind('normal', 'j', ctrl, bottomHalf)
bind('normal', 'k', ctrl, topHalf)

bind('normal', 'l', shift, switchScreen('right'))
bind('normal', 'h', shift, switchScreen('left'))

bind('normal', 'return', ctrl, fullScreen)

function bind(mode, key, mods, callback) {
  if(!keys[mode]) keys[mode] = []

  var binding = api.bind(key, mods, callback)

  binding.disable()

  keys[mode].push(binding)
}

function toWindow(str) {
  return function() {
    api.launch(str)

    setMode('insert')()
  }
}

function setMode(mode) {
  return function() {
    api.alert(faces[Math.floor(Math.random() * faces.length)], 0.05)

    if(keys[currentMode]) {
      keys[currentMode].forEach(function(key) {
        key.disable()
      })
    }

    if(keys[mode]) {
      keys[mode].forEach(function(key) {
        key.enable()
      })
    }

    currentMode = mode
  }
}

function focus(direction) {
  return function() {
    Window.focusedWindow()['focusWindow' + direction]()
    setMode('insert')()
  }
}

function fullScreen() {
  toGrid(Window.focusedWindow(), 0, 0, 1, 1)
}

function topHalf() {
  toGrid(Window.focusedWindow(), 0, 0, 1, 0.5)
}

function bottomHalf() {
  toGrid(Window.focusedWindow(), 0, 0.5, 1, 0.5)
}

function rightHalf() {
  toGrid(Window.focusedWindow(), 0.5, 0, 0.5, 1)
}

function leftHalf() {
  toGrid(Window.focusedWindow(), 0, 0, 0.5, 1)
}

function toGrid(window, x, y, width, height) {
  var screen = window.screen().frameWithoutDockOrMenu()

  window.setFrame(calculateGrid())

  window.focusWindow()

  function calculateGrid() {
    var gridX = Math.round(x * screen.width) + screen.x
    var gridY = Math.round(y * screen.height) + screen.y
    var gridWidth = Math.round(width * screen.width)
    var gridHeight = Math.round(height * screen.height)

    return {
        x: gridX
      , y: gridY
      , width: gridWidth
      , height: gridHeight
    }
  }
}

var faces = [
  "( .-. )",
  "( .o.)",
  "( `·´ )",
  "( ° ͜ ʖ °)",
  "( ͡° ͜ʖ ͡°)",
  "( ⚆ _ ⚆ )",
  "( ︶︿︶)",
  "( ﾟヮﾟ)",
  "(\\/)(°,,,°)(\\/)",
  "(¬_¬)",
  "(¬º-°)¬",
  "(¬‿¬)",
  "(°ロ°)☝",
  "(´・ω・)っ",
  "(ó ì_í)",
  "(ʘᗩʘ')",
  "(ʘ‿ʘ)",
  "(̿▀̿ ̿Ĺ̯̿̿▀̿ ̿)̄",
  "(͡° ͜ʖ ͡°)",
  "(ಠ_ಠ)",
  "(ಠ‿ಠ)",
  "(ಠ⌣ಠ)",
  "(ಥ_ಥ)",
  "(ಥ﹏ಥ)",
  "(ง ͠° ͟ل͜ ͡°)ง",
  "(ง ͡ʘ ͜ʖ ͡ʘ)ง",
  "(ง •̀_•́)ง",
  "(ง'̀-'́)ง",
  "(ง°ل͜°)ง",
  "(ง⌐□ل͜□)ง",
  "(ღ˘⌣˘ღ)",
  "(ᵔᴥᵔ)",
  "(•ω•)",
  "(•◡•)/",
  "(⊙ω⊙)",
  "(⌐■_■)",
  "(─‿‿─)",
  "(╯°□°）╯",
  "(◕‿◕)",
  "(☞ﾟ∀ﾟ)☞",
  "(❍ᴥ❍ʋ)",
  "(っ◕‿◕)っ",
  "(づ｡◕‿‿◕｡)づ",
  "(ノಠ益ಠ)ノ",
  "(ノ・∀・)ノ",
  "(；一_一)",
  "(｀◔ ω ◔´)",
  "(｡◕‿‿◕｡)",
  "(ﾉ◕ヮ◕)ﾉ",
  "*<{:¬{D}}}",
  "=^.^=",
  "t(-.-t)",
  "| (• ◡•)|",
  "~(˘▾˘~)",
  "¬_¬",
  "¯(°_o)/¯",
  "¯\_(ツ)_/¯",
  "°Д°",
  "ɳ༼ຈل͜ຈ༽ɲ",
  "ʅʕ•ᴥ•ʔʃ",
  "ʕ´•ᴥ•`ʔ",
  "ʕ•ᴥ•ʔ",
  "ʕ◉.◉ʔ",
  "ʕㅇ호ㅇʔ",
  "ʕ；•`ᴥ•´ʔ",
  "ʘ‿ʘ",
  "͡° ͜ʖ ͡°",
  "ζ༼Ɵ͆ل͜Ɵ͆༽ᶘ",
  "Ѱζ༼ᴼل͜ᴼ༽ᶘѰ",
  "ب_ب",
  "٩◔̯◔۶",
  "ಠ_ಠ",
  "ಠoಠ",
  "ಠ~ಠ",
  "ಠ‿ಠ",
  "ಠ⌣ಠ",
  "ಠ╭╮ಠ",
  "ರ_ರ",
  "ง ͠° ل͜ °)ง",
  "๏̯͡๏﴿",
  "༼ ºººººل͟ººººº ༽",
  "༼ ºل͟º ༽",
  "༼ ºل͟º༼",
  "༼ ºل͟º༽",
  "༼ ͡■ل͜ ͡■༽",
  "༼ つ ◕_◕ ༽つ",
  "༼ʘ̚ل͜ʘ̚༽",
  "ლ(´ڡ`ლ)",
  "ლ(́◉◞౪◟◉‵ლ)",
  "ლ(ಠ益ಠლ)",
  "ᄽὁȍ ̪őὀᄿ",
  "ᔑ•ﺪ͟͠•ᔐ",
  "ᕕ( ᐛ )ᕗ",
  "ᕙ(⇀‸↼‶)ᕗ",
  "ᕙ༼ຈل͜ຈ༽ᕗ",
  "ᶘ ᵒᴥᵒᶅ",
  "‎‎(ﾉಥ益ಥ）ﾉ",
  "≧☉_☉≦",
  "⊙▃⊙",
  "⊙﹏⊙",
  "┌( ಠ_ಠ)┘",
  "╚(ಠ_ಠ)=┐",
  "◉_◉",
  "◔ ⌣ ◔",
  "◔̯◔",
  "◕‿↼",
  "◕‿◕",
  "☉_☉",
  "☜(⌒▽⌒)☞",
  "☼.☼",
  "♥‿♥",
  "⚆ _ ⚆",
  "✌(-‿-)✌",
  "〆(・∀・＠)",
  "ノ( º _ ºノ)",
  "ノ( ゜-゜ノ)",
  "ヽ( ͝° ͜ʖ͡°)ﾉ",
  "ヽ(`Д´)ﾉ",
  "ヽ༼° ͟ل͜ ͡°༽ﾉ",
  "ヽ༼ʘ̚ل͜ʘ̚༽ﾉ",
  "ヽ༼ຈل͜ຈ༽ง",
  "ヽ༼ຈل͜ຈ༽ﾉ",
  "ヽ༼Ὸل͜ຈ༽ﾉ",
  "ヾ(⌐■_■)ノ",
  "꒰･◡･๑꒱",
  "﴾͡๏̯͡๏﴿",
  "｡◕‿◕｡",
  "ʕノ◔ϖ◔ʔノ",
  "꒰•̥̥̥̥̥̥̥ ﹏ •̥̥̥̥̥̥̥̥๑꒱",
  "ಠ_ರೃ",
  "(ू˃̣̣̣̣̣̣︿˂̣̣̣̣̣̣ ू)",
  "(ꈨຶꎁꈨຶ)۶”",
  "(ꐦ°᷄д°᷅)",
  "(۶ૈ ۜ ᵒ̌▱๋ᵒ̌ )۶ૈ=͟͟͞͞ ⌨",
  "₍˄·͈༝·͈˄₎◞ ̑̑ෆ⃛",
  "(*ﾟ⚙͠ ∀ ⚙͠)ﾉ❣",
  "٩꒰･ัε･ั ꒱۶",
  "ヘ（。□°）ヘ",
  "˓˓(ृ　 ु ॑꒳’)ु(ृ’꒳ ॑ ृ　)ु˒˒˒",
  "꒰✘Д✘◍꒱",
  "૮( ᵒ̌ૢཪᵒ̌ૢ )ა",
  "“ψ(｀∇´)ψ",
  "ಠﭛಠ",
  "(๑>ᴗ<๑)",
  "(۶ꈨຶꎁꈨຶ )۶ʸᵉᵃʰᵎ",
  "٩(•̤̀ᵕ•̤́๑)ᵒᵏᵎᵎᵎᵎ",
  "(oT-T)尸",
  "(✌ﾟ∀ﾟ)☞",
  "ಥ‿ಥ",
  "ॱ॰⋆(˶ॢ‾᷄﹃‾᷅˵ॢ)",
  "┬┴┬┴┤  (ಠ├┬┴┬┴",
  "( ˘ ³˘)♥",
  "Σ (੭ु ຶਊ ຶ)੭ु⁾⁾",
  "(⑅ ॣ•͈ᴗ•͈ ॣ)",
  "ヾ(´￢｀)ﾉ",
  "(•̀o•́)ง",
  "(๑•॒̀ ູ॒•́๑)",
  "⚈้̤͡ ˌ̫̮ ⚈้̤͡",
  "=͟͟͞͞ =͟͟͞͞ ﾍ( ´Д`)ﾉ",
  "(((╹д╹;)))",
  "•̀.̫•́✧",
  "(ᵒ̤̑ ₀̑ ᵒ̤̑)",
  "\_(ʘ_ʘ)_/"
]

function switchScreen(direction) {
  var command = direction === 'left' ? 'previousScreen' : 'nextScreen'
  return function() {
    var window = Window.focusedWindow()

    if(!window) return
    if(window.screen() === window.screen().nextScreen()) return
    if(window.screen().nextScreen().frameIncludingDockAndMenu().x < 0) {
      return
    }

    moveToScreen(window, window.screen()[command]())
  }
}

function moveToScreen(window, screen) {
  if(!window) return
  if(!screen) return

  var frame = window.frame()
  var oldScreenRect = window.screen().frameWithoutDockOrMenu()
  var newScreenRect = screen.frameWithoutDockOrMenu()
  var xRatio = newScreenRect.width / oldScreenRect.width
  var yRatio = newScreenRect.height / oldScreenRect.height

  window.setFrame({
      x: oldScreenRect.x * xRatio + newScreenRect.x - 0.5 * frame.width
    , y: oldScreenRect.y * yRatio + newScreenRect.y - 0.5 * frame.height
    , width: frame.width
    , height: frame.height
  })
}

setMode('insert')()

