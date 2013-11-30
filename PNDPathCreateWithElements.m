//
//  PNDPathCreateWithElements.m
//
//  Created by Alexsander Akers on 11/29/13.
//  Copyright (c) 2013 Pandamonia LLC. All rights reserved.
//

#import "PNDPathCreateWithElements.h"

CGPathRef PNDPathCreateWithElements(const PNDPathElement elements[], size_t count, const CGAffineTransform *transform)
{
	CGMutablePathRef mutablePath = CGPathCreateMutable();
	
	for (size_t i = 0; i < count; i++) {
		PNDPathElement element = elements[i];
		switch (element.type) {
			case PNDPathElementTypeMoveToPoint:
				CGPathMoveToPoint(mutablePath, NULL, element.values[0], element.values[1]);
				break;

			case PNDPathElementTypeAddLineToPoint:
				CGPathAddLineToPoint(mutablePath, NULL, element.values[0], element.values[1]);
				break;
				
			case PNDPathElementTypeAddQuadCurveToPoint:
				CGPathAddQuadCurveToPoint(mutablePath, NULL, element.values[0], element.values[1], element.values[2], element.values[3]);
				break;

			case PNDPathElementTypeAddCurveToPoint:
				CGPathAddCurveToPoint(mutablePath, NULL, element.values[0], element.values[1], element.values[2], element.values[3], element.values[4], element.values[5]);
				break;
				
				
			case PNDPathElementTypeCloseSubpath:
				CGPathCloseSubpath(mutablePath);
				break;
				
				
			case PNDPathElementTypeAddRoundedRect:
				CGPathAddRoundedRect(mutablePath, NULL, (CGRect){ element.values[0], element.values[1], element.values[2], element.values[3] }, element.values[4], element.values[5]);
				break;
				
			case PNDPathElementTypeAddRect:
				CGPathAddRect(mutablePath, NULL, (CGRect){ element.values[0], element.values[1], element.values[2], element.values[3] });
				break;
				
			case PNDPathElementTypeAddEllipseInRect:
				CGPathAddEllipseInRect(mutablePath, NULL, (CGRect){ element.values[0], element.values[1], element.values[2], element.values[3] });
				break;
				
			case PNDPathElementTypeAddRelativeArc:
				CGPathAddRelativeArc(mutablePath, NULL, element.values[0], element.values[1], element.values[2], element.values[3], element.values[4]);
				break;
				
			case PNDPathElementTypeAddArcClockwise:
				CGPathAddArc(mutablePath, NULL, element.values[0], element.values[1], element.values[2], element.values[3], element.values[4], true);
				break;
				
			case PNDPathElementTypeAddArcCounterclockwise:
				CGPathAddArc(mutablePath, NULL, element.values[0], element.values[1], element.values[2], element.values[3], element.values[4], false);
				break;
				
			case PNDPathElementTypeAddArcToPoint:
				CGPathAddArcToPoint(mutablePath, NULL, element.values[0], element.values[1], element.values[2], element.values[3], element.values[4]);
				break;
		}
	}
	
	CGPathRef path = CGPathCreateCopyByTransformingPath(mutablePath, transform);
	CGPathRelease(mutablePath);
	
	return path;
}
