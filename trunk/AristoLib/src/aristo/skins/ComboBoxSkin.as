<?xml version="1.0" encoding="UTF-8"?>
<actionScriptProperties mainApplicationPath="AristoCSSLib.as" version="3">
<compiler additionalCompilerArguments="" copyDependentFiles="false" enableModuleDebug="true" generateAccessible="false" htmlExpressInstall="true" htmlGenerate="false" htmlHistoryManagement="false" htmlPlayerVersion="9.0.124" htmlPlayerVersionCheck="true" outputFolderPath="bin" sourceFolderPath="src" strict="true" useApolloConfig="false" verifyDigests="true" warn="true">
<compilerSourcePath/>
<libraryPath defaultLinkType="1">
<libraryPathEntry kind="4" path=""/>
</libraryPath>
<sourceAttachmentPath/>
</compiler>
<applications>
<application path="AristoCSSLib.as"/>
</applications>
<modules/>
<buildCSSFiles/>
</actionScriptProperties>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               rRadius1;
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