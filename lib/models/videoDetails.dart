class VideoDetails {
  String imageUrl, channelLogoUrl, videoName, channelName, views, age,videoUrl;
  VideoDetails(
      {this.imageUrl,
      this.videoUrl,
      this.channelLogoUrl,
      this.videoName,
      this.channelName,
      this.views,
      this.age});
}

List<VideoDetails> videos = [
  VideoDetails(imageUrl:'assets/images/container.png' ,channelLogoUrl:'assets/images/flutter_logo.png' ,channelName:'Flutter' ,videoName:'Flutter Container' ,views:'73K' ,age:'10 months ago',videoUrl: 'assets/videos/Container.mp4' ),
  VideoDetails(imageUrl:'assets/images/stack.png' ,channelLogoUrl:'assets/images/flutter_logo.png' ,channelName:'Flutter' ,videoName:'Stack' ,views:'60K' ,age:'7 months ago' ),
  VideoDetails(imageUrl:'assets/images/aspRatio.png' ,channelLogoUrl:'assets/images/flutter_logo.png' ,channelName:'Flutter' ,videoName:'Aspect ratio' ,views:'25K' ,age:'8 months ago',videoUrl: 'assets/videos/AspectRatio.mp4' ),
  VideoDetails(imageUrl:'assets/images/fadeTrans.png' ,channelLogoUrl:'assets/images/flutter_logo.png' ,channelName:'Flutter' ,videoName:'Fade Transition' ,views:'20K' ,age:'7 months ago',videoUrl: 'assets/videos/FadeTransition.mp4' ),
  VideoDetails(imageUrl:'assets/images/positioned.png' ,channelLogoUrl:'assets/images/flutter_logo.png' ,channelName:'Flutter' ,videoName:'Positioned' ,views:'30K' ,age:'9 months ago',videoUrl: 'assets/videos/Positioned.mp4' ),
  VideoDetails(imageUrl:'assets/images/sizedbox.png' ,channelLogoUrl:'assets/images/flutter_logo.png' ,channelName:'Flutter' ,videoName:'Sized Box' ,views:'65K' ,age:'11 months ago',videoUrl: 'assets/videos/SizedBox.mp4' ),
  VideoDetails(imageUrl:'assets/images/mediaqry.png' ,channelLogoUrl:'assets/images/flutter_logo.png' ,channelName:'Flutter' ,videoName:'Media Query' ,views:'40K' ,age:'4 months ago',videoUrl: 'assets/videos/MediaQuery.mp4' ),
];
