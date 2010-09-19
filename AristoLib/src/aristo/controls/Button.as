/*
The MIT License

Copyright (c) 2010 Patrick McMichael

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package aristo.controls
{
    import flash.filters.DropShadowFilter;
    import mx.controls.Button;
    
    public class Button extends mx.controls.Button
    {
        [Inspectable( defaultValue=1 )]
        public var shadowDistance:Number = 1;
        
        [Inspectable( defaultValue=45 )]
        public var shadowAngle:Number = 45;
        
        [Inspectable( defaultValue=0xFFFFFF )]
        public var shadowColor:Number = 0xFFFFFF;
        
        [Inspectable( defaultValue=1 )]
        public var shadowAlpha:Number = 1;
        
        [Inspectable( defaultValue=0 )]
        public var shadowBlur:Number = 0;
        
        public function Button()
        {
            super();
        }
        
        override protected function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ):void
        {
            super.updateDisplayList( unscaledWidth, unscaledHeight );
            
            if ( getStyle( "shadowDistance" ))
            {
                shadowDistance = getStyle( "shadowDistance" );
            }
            
            if ( getStyle( "shadowAngle" ))
            {
                shadowAngle = getStyle( "shadowAngle" );
            }
            
            if ( getStyle( "shadowColor" ))
            {
                shadowColor = getStyle( "shadowColor" );
            }
            
            if ( getStyle( "shadowAlpha" ))
            {
                shadowAlpha = getStyle( "shadowAlpha" );
            }
            
            if ( getStyle( "shadowBlur" ))
            {
                shadowBlur = getStyle( "shadowBlur" );
            }
            
            textField.filters = [ new DropShadowFilter( shadowDistance, shadowAngle, shadowColor, shadowAlpha, shadowBlur, shadowBlur )];
        }
            
        override protected function commitProperties():void
        {
            super.commitProperties();
            textField.filters = [ new DropShadowFilter( shadowDistance, shadowAngle, shadowColor, shadowAlpha, shadowBlur, shadowBlur )];
        }
    
    }
}