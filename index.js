import {NativeModules, Platform} from 'react-native'
const native = Platform.OS === 'ios' ?  NativeModules.VideoPlayer : NativeModules.SuperPlayerModule
const play = (url) => {
  if (!url) {
    console.warn('视频没有url')
    return
  }
  const finalUrl = url.startsWith('http') ? url : 'http://' + url
  native && native.play && native.play(finalUrl)
}

export default play
