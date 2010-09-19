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
    import flash.events.FocusEvent;
    
    import mx.controls.Alert;
    import mx.controls.TextInput;

    public class TextInput extends mx.controls.TextInput
    {
        [Inspectable( defaultValue=0xBDC7D3 )]
        public var placeholderColor:Number = 0xBDC7D3;
        
        [Bindable]
        protected var _placeholder:String = "";
        protected var _textColor:Number = 0x0;
        protected var _focused:Boolean = false;
        protected var _showingPlaceholder:Boolean = false;
        
        public function TextInput()
        {
            super();
            
            this.addEventListener(FocusEvent.FOCUS_IN, this._onFocusIn, false, 0, true);
            this.addEventListener(FocusEvent.FOCUS_OUT, this._onFocusOut, false, 0, true);
        }
        
        [Bindable]
        public function get placeholder():String
        {
            return this._placeholder;
        }
        
        public function set placeholder( pPlaceholder:String ):void
        {
            this._placeholder = pPlaceholder;
            this.invalidateDisplayList();
        }
        
        protected function _onFocusIn( p:*=null ):void
        {
            this._focused = true;
            this.invalidateDisplayList();
        }
        
        protected function _onFocusOut( p:*=null ):void
        {
            this._focused = false;
            this.invalidateDisplayList();
        }
        
        override protected function updateDisplayList( unscaledWidth:Number, unscaledHeight:Number ):void
        {
            super.updateDisplayList( unscaledWidth, unscaledHeight );
            
            var color:Number = getStyle( "color" );
            if (!this._focused && (this.text.length <= 0 && this._placeholder.length > 0))
            {
                // Setup placeholder text
                
                if ( this.getStyle( "placeholderColor" ))
                {
                    this.placeholderColor = this.getStyle( "placeholderColor" ); 
                }
                
                this._textColor = color;
                
                this.setStyle( "color", this.placeholderColor );
                this.text = this._placeholder;
                
                this._showingPlaceholder = true;
            }
            else if (this._showingPlaceholder)
            {
                // Restore
                
                this.setStyle( "color", this._textColor );
                this.text = "";
                
                this._showingPlaceholder = false;
            }
        }
    }
}