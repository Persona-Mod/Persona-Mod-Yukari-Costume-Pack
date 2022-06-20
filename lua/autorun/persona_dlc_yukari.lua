/*--------------------------------------------------
	*** Copyright (c) 2012-2021 by Cpt. Hazama, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
if (!file.Exists("autorun/persona_main.lua","LUA")) then return end

include("persona_global.lua")

hook.Add("PersonaMod_DancerCreated","PersonaModDLC_Yukari_OnInit",function(self,ply)
	self:RandomizeCinematics("dance_wanttobeclose",1285)
	self:RandomizeCinematics("dance_wanttobeclose_2",759)
	self:RandomizeCinematics("dance_wanttobeclose_3",790)
	self:RandomizeCinematics("dance_wanttobeclose_4",1621)
	
	local exp = {"smile_teeth","smile","eyeOpen","eyeSerious","browUp","neutral"}
	self:RandomizeExpressions(exp,"dance_wanttobeclose",1285)
	self:RandomizeExpressions(exp,"dance_wanttobeclose_2",759)
	self:RandomizeExpressions(exp,"dance_wanttobeclose_3",790)
	self:RandomizeExpressions(exp,"dance_wanttobeclose_4",1621)
end)

hook.Add("Initialize","PersonaModDLC_Yukari",function()
	local defSong = "When The Moon's Reaching Out Stars -Remix-"
	local newSong = "Want To Be Close -Remix-"
	P_AddCostume("Yukari Takeba",{Name = "Winter Clothes", Model = "_winter", Offset = 0.1, ReqSong = newSong, ReqScore = 25000})
	P_AddCostume("Yukari Takeba",{Name = "Summer Clothes", Model = "_summer", Offset = 0.1, ReqSong = defSong, ReqScore = 12000})
	P_AddCostume("Yukari Takeba",{Name = "Summer Uniform", Model = "_summeruniform", Offset = 0.1, ReqSong = defSong, ReqScore = 15000})
	P_AddCostume("Yukari Takeba",{Name = "Pink Bikini", Model = "_bikini", Offset = 0.1, ReqSong = defSong, ReqScore = 20000})
	P_AddCostume("Yukari Takeba",{Name = "Cheer Leader", Model = "_cheer", Offset = 0.1, ReqSong = newSong, ReqScore = 15000})
	P_AddCostume("Yukari Takeba",{Name = "Pink Argus", Model = "_featherwoman", Offset = 0.1, ReqSong = newSong, ReqScore = 40000, OnChangedOutfit = function(self,oldMdl,newMdl,outfit)
		self:SetSkin(0)
	end})
	P_AddCostume("Yukari Takeba",{Name = "Pink Argus (Nega ver.)", Model = "_featherwoman", Offset = 0.1, ReqSong = newSong, ReqScore = 45000, OnChangedOutfit = function(self,oldMdl,newMdl,outfit)
		self:SetSkin(1)
	end})
	P_AddCostume("Yukari Takeba",{Name = "Red High-Cut Armor", Model = "_armor", Offset = 1, ReqSong = newSong, ReqScore = 60000})

	local danceAnim = "dance_wanttobeclose"
	local songData = {dance = danceAnim, song = "cpthazama/persona3_dance/music/c012_03.mp3", name = "Want To Be Close -Remix-", length = 173, delay = 0}
	local animData = {
		[1] = {anim = danceAnim,next = danceAnim .. "_2",endEarlyTime = 0},
		[2] = {anim = danceAnim .. "_2",next = danceAnim .. "_3",endEarlyTime = 0},
		[3] = {anim = danceAnim .. "_3",next = danceAnim .. "_2",endEarlyTime = 0},
		[4] = {anim = danceAnim .. "_2",next = danceAnim .. "_4",endEarlyTime = 0},
		[5] = {anim = danceAnim .. "_4",next = false,endEarlyTime = 0}
	}
	P_AddSong("Yukari Takeba",songData,animData)
end)