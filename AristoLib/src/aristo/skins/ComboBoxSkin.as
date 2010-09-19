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

package aristo.skins
{    
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.GradientType;
    import flash.display.Graphics;
    import flash.geom.Matrix;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    
    import mx.skins.halo.ComboBoxArrowSkin;
    import mx.skins.halo.HaloColors;
    import mx.styles.StyleManager;
    import mx.utils.ColorUtil;
 
    public class ComboBoxSkin extends ComboBoxArrowSkin {
        private static var cache:Object = {};
 
        [Embed(source="../../assets/images/select.png")]
        protected var CB_SKIN_GRAPHIC:Class;
 
        public function ComboBoxSkin() {
            super();
        }
 
        private static function calcDerivedStyles(themeColor:uint, borderColor:uint, fillColor0:uint, fillColor1:uint):Object {
            var key:String = HaloColors.getCacheKey(themeColor, borderColor, fillColor0, fillColor1);
            if (!cache[key]) {
                var o:Object = cache[key] = {};
                HaloColors.addHaloColors(o, themeColor, fillColor0, fillColor1);
            }
            return cache[key];
        }
 
        override protected function updateDisplayList(w:Number, h:Number):void {
            super.updateDisplayList(w, h);
 
            var arrowColor:uint = getStyle("iconColor");
            var borderColor:uint = getStyle("borderColor");
            var cornerRadius:Number = getStyle("cornerRadius");
            var dropdownBorderColor:Number = getStyle("dropdownBorderColor");
            var fillAlphas:Array = getStyle("fillAlphas");
            var fillColors:Array = getStyle("fillColors");
            StyleManager.getColorNames(fillColors);
            var highlightAlphas:Array = getStyle("highlightAlphas");
            var themeColor:uint = getStyle("themeColor");
 
            // The dropdownBorderColor is currently only used
            // when displaying an error state.
            if (!isNaN(dropdownBorderColor)) {
                borderColor = dropdownBorderColor;
            }
 
            var derStyles:Object = calcDerivedStyles(themeColor, borderColor, fillColors[0], fillColors[1]);
            var borderColorDrk1:Number = ColorUtil.adjustBrightness2(borderColor, -50);
            var themeColorDrk1:Number = ColorUtil.adjustBrightness2(themeColor, -25);
            var cornerRadius1:Number = Math.max(cornerRadius - 1, 0);
            var cr:Object = { tl: 0, tr: cornerRadius, bl: 0, br: cornerRadius };
            var cr1:Object = { tl: 0, tr: cornerRadius1, bl: 0, br: cornerRadius1 };
            var arrowOnly:Boolean = true;
 
            // If our name doesn't include "editable", we are drawing the non-edit
            // skin which spans the entire control
            if (name.indexOf("editable") < 0) {
                arrowOnly = false;
                cr.tl = cr.bl = cornerRadius;
                cr1.tl = cr1.bl = cornerRadius1;
            }
 
            var g:Graphics = graphics;
            g.clear();
 
            // Draw the border and fill.
            switch (name) {
                case "upSkin":
                case "editableUpSkin": {
                    
                    /*
                       var upFillColors:Array = [ fillColors[0], fillColors[1] ];
                       var upFillAlphas:Array = [ fillAlphas[0], fillAlphas[1] ];
 
                    // border
                    drawRoundRect(0, 0, w, h, cr,
                        [ borderColor, borderColorDrk1 ], 1,
                        verticalGradientMatrix(0, 0, w, h),
                        GradientType.LINEAR, null,
                        { x: 1, y: 1, w: w - 2, h: h - 2, r: cr1 });
 
                    // button fill
                    drawRoundRect(1, 1, w - 2, h - 2, cr1,
                        upFillColors, upFillAlphas,
                        verticalGradientMatrix(1, 1, w - 2, h - 2));
 
                    // top highlight
                    drawRoundRect(1, 1, w - 2, (h - 2) / 2,
                        { tl: cornerRadius1, tr: cornerRadius1, bl: 0, br: 0 },
                        [ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
                        verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));
                    */
                    
                    break;
                }
 
                case "overSkin":
                case "editableOverSkin": {
                    var overFillColors:Array;
                    if (fillColors.length > 2) {
                        overFillColors = [ fillColors[2], fillColors[3] ];
                    } else {
                        overFillColors = [ fillColors[0], fillColors[1] ];
                    }
 
                    var overFillAlphas:Array;
                    if (fillAlphas.length > 2) {
                        overFillAlphas = [ fillAlphas[2], fillAlphas[3] ];
                      } else {
                        overFillAlphas = [ fillAlphas[0], fillAlphas[1] ];
                      }
 
                    // border
                    drawRoundRect(0, 0, w, h, cr,
                        [ themeColor, themeColorDrk1 ], 1,
                        verticalGradientMatrix(0, 0, w, h),
                        GradientType.LINEAR, null,
                        { x: 1, y: 1, w: w - 2, h: h - 2, r: cr1 });
 
                    // button fill
                    drawRoundRect(1, 1, w - 2, h - 2, cr1,
                        overFillColors, overFillAlphas,
                        verticalGradientMatrix(1, 1, w - 2, h - 2));
 
                    // top highlight
                    drawRoundRect(1, 1, w - 2, (h - 2) / 2,
                        { tl: cornerRadius1, tr: cornerRadius1, bl: 0, br: 0 },
                        [ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
                        verticalGradientMatrix(0, 0, w - 2, (h - 2) / 2));
 
                    break;
                }
 
                case "downSkin":
                case "editableDownSkin": {
                    // border
                    drawRoundRect(0, 0, w, h, cr,
                        [ themeColor, themeColorDrk1 ], 1,
                        verticalGradientMatrix(0, 0, w, h));
 
                    // button fill
                    drawRoundRect(1, 1, w - 2, h - 2, cr1,
                        [ derStyles.fillColorPress1, derStyles.fillColorPress2 ], 1,
                        verticalGradientMatrix(1, 1, w - 2, h - 2));
 
                    // top highlight
                    drawRoundRect(1, 1, w - 2, (h - 2) / 2,
                        { tl: cornerRadius1, tr: cornerRadius1, bl: 0, br: 0 },
                        [ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
                        verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2));
 
                    break;
                }
 
                case "disabledSkin":
                case "editableDisabledSkin": {
                       var disFillColors:Array = [ fillColors[0], fillColors[1] ];
                    var disFillAlphas:Array = [ Math.max(0, fillAlphas[0] - 0.15), Math.max(0, fillAlphas[1] - 0.15) ];
 
                    // border
                    drawRoundRect(0, 0, w, h, cr,
                        [ borderColor, borderColorDrk1 ], 0.5,
                        verticalGradientMatrix(0, 0, w, h ),
                        GradientType.LINEAR, null,
                        { x: 1, y: 1, w: w - 2, h: h - 2, r: cr1 });
 
                    // button fill
                    drawRoundRect(1, 1, w - 2, h - 2, cr1,
                        disFillColors, disFillAlphas,
                        verticalGradientMatrix(0, 0, w - 2, h - 2));
 
                    arrowColor = getStyle("disabledIconColor");
                    break;
                }
            }
 
 
            // The following code desperately needs to be refactored into member variables
            // so that it can actually use all the caching and smart facilities.
            // Code swiped from Adobe at:
            // http://opensource.adobe.com/svn/opensource/flex/sdk/trunk/frameworks/projects/spark/src/spark/primitives/BitmapImage.as
            
            var bitmap:Bitmap = new CB_SKIN_GRAPHIC();
            var _bitmapData:BitmapData = bitmap.bitmapData;
            // Our skin graphic is 103x24, with a tab on the end that is 30 pixels wide
            bitmap.scale9Grid = new Rectangle(2,2,73,20);
            bitmap.width = w;
            bitmap.height = h; 
            
            var cachedSourceGrid:Array = null;
            var _scaleGridLeft:Number = bitmap.scale9Grid.left;
            var _scaleGridRight:Number = bitmap.scale9Grid.right;
            var _scaleGridTop:Number = bitmap.scale9Grid.top;
            var _scaleGridBottom:Number = bitmap.scale9Grid.bottom;
            if (cachedSourceGrid == null)
            {
                // Generate the 16 points of the source (unscaled) grid
                cachedSourceGrid = [];
                cachedSourceGrid.push([new Point(0, 0), new Point(_scaleGridLeft, 0), 
                                new Point(_scaleGridRight, 0), new Point(_bitmapData.width, 0)]);
                cachedSourceGrid.push([new Point(0, _scaleGridTop), new Point(_scaleGridLeft, _scaleGridTop), 
                                new Point(_scaleGridRight, _scaleGridTop), new Point(_bitmapData.width, _scaleGridTop)]);
                cachedSourceGrid.push([new Point(0, _scaleGridBottom), new Point(_scaleGridLeft, _scaleGridBottom), 
                                new Point(_scaleGridRight, _scaleGridBottom), new Point(_bitmapData.width, _scaleGridBottom)]);
                cachedSourceGrid.push([new Point(0, _bitmapData.height), new Point(_scaleGridLeft, _bitmapData.height), 
                                new Point(_scaleGridRight, _bitmapData.height), new Point(_bitmapData.width, _bitmapData.height)]);                         
            }
            
            var cachedDestGrid:Array = null;
            var unscaledWidth:Number = w;
            var unscaledHeight:Number = h;
            var previousUnscaledWidth:Number = 0;
            var previousUnscaledHeight:Number = 0;
            if (cachedDestGrid == null || 
                previousUnscaledWidth != unscaledWidth || 
                previousUnscaledHeight != unscaledHeight)
            {
                // Generate teh 16 points of the destination (scaled) grid
                var destScaleGridBottom:Number = unscaledHeight - (_bitmapData.height - _scaleGridBottom);
                var destScaleGridRight:Number = unscaledWidth - (_bitmapData.width - _scaleGridRight);      
                cachedDestGrid = [];
                cachedDestGrid.push([new Point(0, 0), new Point(_scaleGridLeft, 0), 
                                new Point(destScaleGridRight, 0), new Point(unscaledWidth, 0)]);
                cachedDestGrid.push([new Point(0, _scaleGridTop), new Point(_scaleGridLeft, _scaleGridTop), 
                                new Point(destScaleGridRight, _scaleGridTop), new Point(unscaledWidth, _scaleGridTop)]);
                cachedDestGrid.push([new Point(0, destScaleGridBottom), new Point(_scaleGridLeft, destScaleGridBottom), 
                                new Point(destScaleGridRight, destScaleGridBottom), new Point(unscaledWidth, destScaleGridBottom)]);
                cachedDestGrid.push([new Point(0, unscaledHeight), new Point(_scaleGridLeft, unscaledHeight), 
                               new Point(destScaleGridRight, unscaledHeight), new Point(unscaledWidth, unscaledHeight)]);                     
            }                                                   

            var sourceSection:Rectangle = new Rectangle();
            var destSection:Rectangle = new Rectangle();
            
            var matrix:Matrix = new Matrix();
            var roundedDrawX:Number = 0;
            var roundedDrawY:Number = 0;
            
            // Iterate over the columns and rows. We draw each of the nine sections at a calculated
            // scale and translation.        
            for (var rowIndex:int=0; rowIndex < 3; rowIndex++) 
            {
                for (var colIndex:int = 0; colIndex < 3; colIndex++) 
                {   
                    // Create the source and destination rectangles for the current section
                    sourceSection.topLeft = cachedSourceGrid[rowIndex][colIndex];
                    sourceSection.bottomRight = cachedSourceGrid[rowIndex+1][colIndex+1];
                    
                    destSection.topLeft = cachedDestGrid[rowIndex][colIndex];
                    destSection.bottomRight = cachedDestGrid[rowIndex+1][colIndex+1];
                    
                    matrix.identity();
                    // Scale the bitmap by the ratio between the source and destination dimensions
                    matrix.scale(destSection.width / sourceSection.width, destSection.height / sourceSection.height);
                    // Translate based on the difference between the source and destination coordinates,
                    // making sure to account for the new scale.
                    matrix.translate(destSection.x - sourceSection.x * matrix.a, destSection.y - sourceSection.y * matrix.d);
                    matrix.translate(roundedDrawX, roundedDrawY);
                    
                    // Draw the bitmap for the current section
                    g.beginBitmapFill(_bitmapData, matrix);
                    g.drawRect(destSection.x + roundedDrawX, destSection.y + roundedDrawY, destSection.width, destSection.height);
                    g.endFill();
                 }
            }
            
            /*
            // Draw the triangle.
            
            g.beginFill(arrowColor);
            g.moveTo(w - 11.5, h / 2 + 3);
            g.lineTo(w - 15, h / 2 - 2);
            g.lineTo(w - 8, h / 2 - 2);
            g.lineTo(w - 11.5, h / 2 + 3);
            g.endFill();
            
            */
        }
    }

}