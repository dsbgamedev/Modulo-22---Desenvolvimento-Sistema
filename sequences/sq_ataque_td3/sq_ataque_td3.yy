{
  "resourceType": "GMSequence",
  "resourceVersion": "1.4",
  "name": "sq_ataque_td3",
  "autoRecord": true,
  "backdropHeight": 768,
  "backdropImageOpacity": 0.5,
  "backdropImagePath": "",
  "backdropWidth": 1366,
  "backdropXOffset": 0.0,
  "backdropYOffset": 0.0,
  "events": {
    "resourceType": "KeyframeStore<MessageEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [],
  },
  "eventStubScript": null,
  "eventToFunction": {
    "0": "cria_screenshake",
    "1": "termina_screenshake",
    "2": "",
    "3": "",
    "4": "",
    "5": "",
    "6": "",
  },
  "length": 60.0,
  "lockOrigin": false,
  "moments": {
    "resourceType": "KeyframeStore<MomentsEventKeyframe>",
    "resourceVersion": "1.0",
    "Keyframes": [],
  },
  "parent": {
    "name": "Sequences",
    "path": "folders/Sequences.yy",
  },
  "playback": 0,
  "playbackSpeed": 100.0,
  "playbackSpeedType": 0,
  "showBackdrop": true,
  "showBackdropImage": false,
  "spriteId": null,
  "timeUnits": 1,
  "tracks": [
    {"resourceType":"GMGraphicTrack","resourceVersion":"1.0","name":"spr_player_attack_down","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetSpriteKeyframe","resourceVersion":"1.0","Id":{"name":"spr_player_attack_down","path":"sprites/spr_player_attack_down/spr_player_attack_down.yy",},},},"Disabled":false,"id":"c70c1e75-d3d5-4fef-95ad-ec32ea65aaca","IsCreationKey":false,"Key":0.0,"Length":60.0,"Stretch":true,},
        ],},"modifiers":[],"trackColour":4292823282,"tracks":[
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"image_index","builtinName":18,"events":[],"inheritsTrackColour":true,"interpolation":0,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"54b42de1-f8bf-4452-8459-d26f15f63dcd","IsCreationKey":false,"Key":0.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"a876b400-1a98-4ad4-a5f2-16ff16e747ac","IsCreationKey":false,"Key":31.0,"Length":29.0,"Stretch":true,},
            ],},"modifiers":[],"trackColour":4292823282,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"image_speed","builtinName":17,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"1ed4ae66-05d2-449f-a3da-32486872699a","IsCreationKey":false,"Key":0.0,"Length":60.0,"Stretch":true,},
            ],},"modifiers":[],"trackColour":4292823282,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"8c6b33d1-e0c7-4191-95b2-cf7b88aeb02c","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4292823282,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":-1.397171,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":-4.3780746,},},"Disabled":false,"id":"13f7bcaf-c8a8-4bb0-b60e-9a271cc1be30","IsCreationKey":false,"Key":0.0,"Length":60.0,"Stretch":true,},
            ],},"modifiers":[],"trackColour":4292823282,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"2226617e-de8c-403d-9c5c-2a6b26b69f6f","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4292823282,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"9bdd23dd-62c5-460b-8799-a98570257bc3","IsCreationKey":true,"Key":0.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4292823282,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"resourceType":"GMGraphicTrack","resourceVersion":"1.0","name":"_spr_dano_td","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"1.0","Keyframes":[
          {"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"AssetSpriteKeyframe","resourceVersion":"1.0","Id":{"name":"_spr_dano_td","path":"sprites/_spr_dano_td/_spr_dano_td.yy",},},},"Disabled":false,"id":"ed577adb-612e-4f28-9ff4-10cca3024aa0","IsCreationKey":false,"Key":32.0,"Length":28.0,"Stretch":false,},
        ],},"modifiers":[],"trackColour":4283713778,"tracks":[
        {"resourceType":"GMColourTrack","resourceVersion":"1.0","name":"blend_multiply","builtinName":10,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<ColourKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"ColourKeyframe","resourceVersion":"1.0","AnimCurveId":null,"Colour":4294967295,"EmbeddedAnimCurve":null,},},"Disabled":false,"id":"b838105e-1499-450d-b22a-0d5c48b5cb38","IsCreationKey":false,"Key":31.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"ColourKeyframe","resourceVersion":"1.0","AnimCurveId":null,"Colour":16777215,"EmbeddedAnimCurve":null,},},"Disabled":false,"id":"d35dc13b-bf63-46c3-b825-d0ef96aedd0f","IsCreationKey":false,"Key":59.9999,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4283713778,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"b1e6f67a-eb43-46cd-9d13-d612139a598d","IsCreationKey":true,"Key":32.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4283713778,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"babfe055-b8c3-4092-9b41-f573badda2e8","IsCreationKey":false,"Key":31.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"e0550981-53d0-4b6f-a008-9ad350200f1f","IsCreationKey":false,"Key":54.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"457fbc96-7760-4e0d-a7b0-6e705ad99c4d","IsCreationKey":false,"Key":59.9999,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4283713778,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,},},"Disabled":false,"id":"3956bab0-2085-4475-9e80-c0a01c5558a9","IsCreationKey":true,"Key":32.0,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4283713778,"tracks":[],"traits":0,},
        {"resourceType":"GMRealTrack","resourceVersion":"1.0","name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"1.0","Keyframes":[
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,},},"Disabled":false,"id":"d3f28c92-e5b8-4931-9199-71bed7372e3b","IsCreationKey":false,"Key":32.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":30.0,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":30.0,},},"Disabled":false,"id":"ce87c10c-cf8a-4f72-8036-5e8e3546da2c","IsCreationKey":false,"Key":50.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":42.6875,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":30.0,},},"Disabled":false,"id":"bbe8e9a4-4ab5-4f7e-90c1-c11b6ede0342","IsCreationKey":false,"Key":54.0,"Length":1.0,"Stretch":false,},
              {"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"1.0","Channels":{"0":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":42.6875,},"1":{"resourceType":"RealKeyframe","resourceVersion":"1.0","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":30.0,},},"Disabled":false,"id":"1d401a1a-0350-4a25-98a8-93360366230f","IsCreationKey":false,"Key":59.9999,"Length":1.0,"Stretch":false,},
            ],},"modifiers":[],"trackColour":4283713778,"tracks":[],"traits":0,},
      ],"traits":0,},
  ],
  "visibleRange": null,
  "volume": 1.0,
  "xorigin": 0,
  "yorigin": 0,
}