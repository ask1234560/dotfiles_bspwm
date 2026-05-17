-- Requires Subliminal installed and available in PATH
-- mpv subtitle downloader script

local utils = require 'mp.utils'

local lang = 'en'

-- Change these if needed
local opensubtitles_username = os.getenv("OPENSUBTITLES_username")
local opensubtitles_password = os.getenv("OPENSUBTITLES_password")

-- Log to terminal + OSD
local function log(msg)
    local secs = 3
    mp.msg.warn(msg)
    mp.osd_message(msg, secs)
end

local function has_connection()
    local res = utils.subprocess({
        args = { 'ping', '-c', '1', 'google.com' }
    })

    return res.status == 0
end

local function download_subs()
    log('Searching subtitles...')

    local path = mp.get_property('path')

    if not path then
        log('No file loaded')
        return
    end

    if not has_connection() then
        log('Connection not available')
        return
    end

    local args = {
        'subliminal',

        '--provider.opensubtitles.username',
        opensubtitles_username or '',

        '--provider.opensubtitles.password',
        opensubtitles_password or '',

        'download',
        '-l',
        lang,
        path
    }

    local result = utils.subprocess({
        args = args,
        cancellable = false
    })

    mp.msg.info(result.stdout)
    mp.msg.error(result.stderr)

    if result.status == 0 and
       string.find(result.stdout, 'Downloaded') then

        mp.commandv('rescan_external_files')
        log('Subtitles ready!')
    else
        log('No subtitles found')
    end
end

-- Control function: only download if necessary
function control_download()
    duration = tonumber(mp.get_property('duration'))
    if duration < 900 then
        mp.msg.warn('Video is less than 15 minutes\n=> NOT downloading any subtitles')
        return
    end
    -- There does not seem to be any documentation for the 'sub' property,
    -- but it works on both internally encoded as well as external subtitle files!
    -- -> sub = number of subtitle track(s), when they are present
    -- -> sub = 'no' when subtitles are not present
    -- -> sub = 'auto' when called before the 'file-loaded' event is triggered
    sub = tonumber(mp.get_property('sub')) or 0
    if sub > 0 then
        mp.msg.warn('Sub track is already present\n=> NOT downloading other subtitles')
        return
    end
    mp.msg.warn('No sub track was detected\n=> Proceeding to download subtitles:')
    download_subs()
end

-- For enabling auto download sub on startup uncomment below line
-- mp.register_event('file-loaded', control_download)
mp.add_key_binding(nil, 'download_subs', download_subs)
