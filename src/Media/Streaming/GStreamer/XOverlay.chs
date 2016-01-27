module Media.Streaming.GStreamer.XOverlay where

#include <gst/interfaces/xoverlay.h>

import Media.Streaming.GStreamer.Core.Types (Object (..), ObjectClass (..), withObject, castToObject)
import Graphics.UI.Gtk (NativeWindowId (..), fromNativeWindowId)

import Foreign.Ptr
import Foreign.C

xOverlaySetWindowHandle :: ObjectClass o => o -> NativeWindowId -> IO ()
xOverlaySetWindowHandle obj _id = withObject (castToObject obj) $ \ptr1 -> 
                                    gst_x_overlay_set_window_handle ptr1 (fromNativeWindowId _id)

foreign import ccall gst_x_overlay_set_window_handle :: Ptr Object -> CULong -> IO ()
