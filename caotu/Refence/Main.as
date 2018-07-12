package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	
	public class Main extends MovieClip {
		
	 [Embed(source="assets/src-01.swf")] 
     public var src1:Class;
		
	  [Embed(source="assets/src-02.swf")] 
      public var src2:Class;
	  
	  [Embed(source="assets/src-03.swf")] 
      public var src3:Class;
	   
	  [Embed(source="assets/src-04.swf")] 
      public var src4:Class;
	  
	  [Embed(source="assets/src-05.swf")] 
      public var src5:Class; 
	  
	    [Embed(source="assets/src-06.swf")] 
      public var src6:Class; 
	  
		public var mc_content:MovieClip = null;
		public var mc_layer:MovieClip = null;
		public var btn_pre:SimpleButton = null;
		public var btn_next:SimpleButton = null;
		
		private var current:int = 1;
		
		public function Main() {
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private var scene1:MovieClip = null;
		private var contentMC:MovieClip = null;

		private function addedToStageHandler(event:Event):void
		{
			this.btn_next.visible = true;
			this.btn_pre.visible = false;
			this.scene1 = new src1();
			trace(this.scene1)
			this.btn_next.addEventListener(MouseEvent.CLICK, onNextHandler);
			this.btn_pre.addEventListener(MouseEvent.CLICK, onPreHandler);
			this.mc_content.addChild(this.scene1);
		}
					
		private function onNextHandler(event:MouseEvent):void
		{
			this.clearLayer();
			this.btn_pre.visible = true;
			this.clearLayer();
			if(current==1){this.contentMC = new src2();current=2;}
			else if(current==2){this.contentMC = new src3();current=3;}
			else if(current==3){this.contentMC = new src4();current=4;}
			else if(current==4){this.contentMC = new src5();current=5;}
            else if(current==5){this.contentMC = new src6();current=6;this.btn_next.visible = false;}

			this.mc_layer.addChild(contentMC);
			
		}
		
		private function onPreHandler(event:MouseEvent):void
		{
			this.clearLayer();
			this.btn_next.visible = true;		
			if(current==2){this.contentMC = new src1();current=1;this.btn_pre.visible = false;}
			else if(current==3){this.contentMC = new src2();current=2;}
			else if(current==4){this.contentMC = new src3();current=3;}
			else if(current==5){this.contentMC = new src4();current=4;}
			else if(current==6){this.contentMC = new src5();current=5;}
			
			this.mc_layer.addChild(contentMC);
		}	
				
		
		private function clearLayer():void
		{
			while (this.mc_layer.numChildren)
			{
				this.mc_layer.removeChildAt(0);
			}
			
			if (this.contentMC)
			{
				this.contentMC.stop();
				
				var loader:Loader = this.contentMC.getChildAt(0) as Loader;
				if (loader)
				{
					(loader.content as MovieClip).stop();
				}
			}
		}
		
		private function clearContent():void
		{
			while (this.mc_content.numChildren)
			{
				this.mc_content.removeChildAt(0);
			}
		}
	}	
}
