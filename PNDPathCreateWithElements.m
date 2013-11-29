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
			case PNDPathElementTypeAddCurveToPoint:
				CGPathAddCurveToPoint(mutablePath, NULL, element.points[0].x, element.points[0].y, element.points[1].x, element.points[1].y, element.points[2].x, element.points[2].y);
				break;
				
			case PNDPathElementTypeAddLineToPoint:
				CGPathAddLineToPoint(mutablePath, NULL, element.points[0].x, element.points[0].y);
				break;
				
			case PNDPathElementTypeAddQuadCurveToPoint:
				CGPathAddQuadCurveToPoint(mutablePath, NULL, element.points[0].x, element.points[0].y, element.points[1].x, element.points[1].y);
				break;
				
			case PNDPathElementTypeCloseSubpath:
				CGPathCloseSubpath(mutablePath);
				break;
				
			case PNDPathElementTypeMoveToPoint:
				CGPathMoveToPoint(mutablePath, NULL, element.points[0].x, element.points[0].y);
				break;
		}
	}
	
	CGPathRef path = CGPathCreateCopyByTransformingPath(mutablePath, transform);
	CGPathRelease(mutablePath);
	
	return path;
}
