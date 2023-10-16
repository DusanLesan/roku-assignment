sub init()
		m.top.setFocus(true)
		setVideo()

		m.vid = m.top.findNode("testVideo")
		m.rect = m.top.findNode("testRect")
		m.markupGrid = m.top.findNode("markupGrid")

		m.rect.translation = [(m.vid.width - m.rect.width) / 2, (m.vid.height - m.rect.height) / 2]

		m.readPosterGridTask = createObject("roSGNode", "ContentReader")
		m.readPosterGridTask.contenturi = "http://www.omdbapi.com/?s=star&apikey=a07564f9"
		m.readPosterGridTask.observeField("content", "showpostergrid")
		m.readPosterGridTask.control = "RUN"
end sub

sub showpostergrid(msg)
	? "Show the content in a MarkupGrid"
	? "Focus the grid"
	? "Handle item selection"
end sub

sub setVideo()
	videoContent = createObject("RoSGNode", "ContentNode")
	videoContent.url = "https://roku.s.cpl.delvenetworks.com/media/59021fabe3b645968e382ac726cd6c7b/60b4a471ffb74809beb2f7d5a15b3193/roku_ep_111_segment_1_final-cc_mix_033015-a7ec8a288c4bcec001c118181c668de321108861.m3u8"
	videoContent.title = "Test Video"
	videoContent.streamformat = "hls"

	m.video = m.top.findNode("testVideo")
	m.video.content = videoContent
	m.video.control = "play"
end sub