//
//  PNDPathCreateWithElements.h
//
//  Created by Alexsander Akers on 11/29/13.
//  Copyright (c) 2013 Pandamonia LLC. All rights reserved.
//

#define PND_PATH_ELEMENT_MOVE_TO_POINT(x, y) \
((PNDPathElement){ \
	.type = PNDPathElementTypeMoveToPoint, \
	.points = { \
		{ (x), (y) } \
	} \
})

#define PND_PATH_ELEMENT_ADD_LINE_TO_POINT(x, y) \
((PNDPathElement){ \
	.type = PNDPathElementTypeAddLineToPoint, \
	.points = { \
		{ (x), (y) } \
	} \
})

#define PND_PATH_ELEMENT_ADD_QUAD_CURVE_TO_POINT(cpx, cpy, x, y) \
((PNDPathElement){ \
	.type = PNDPathElementTypeAddQuadCurveToPoint, \
	.points = { \
		{ (cpx), (cpy) }, \
		{ (x), (y) } \
	} \
})

#define PND_PATH_ELEMENT_ADD_CURVE_TO_POINT(cp1x, cp1y, cp2x, cp2y, x, y) \
((PNDPathElement){ \
	.type = PNDPathElementTypeAddCurveToPoint, \
	.points = { \
		{ (cp1x), (cp1y) }, \
		{ (cp2x), (cp2y) }, \
		{ (x), (y) } \
	} \
})

#define PND_PATH_ELEMENT_CLOSE_SUBPATH() \
((PNDPathElement){ \
	.type = PNDPathElementTypeCloseSubpath, \
	.points = {} \
})


typedef NS_ENUM(NSUInteger, PNDPathElementType) {
	PNDPathElementTypeMoveToPoint         = kCGPathElementMoveToPoint,
	PNDPathElementTypeAddLineToPoint      = kCGPathElementAddLineToPoint,
	PNDPathElementTypeAddQuadCurveToPoint = kCGPathElementAddQuadCurveToPoint,
	PNDPathElementTypeAddCurveToPoint     = kCGPathElementAddCurveToPoint,
	PNDPathElementTypeCloseSubpath        = kCGPathElementCloseSubpath
};

typedef struct PNDPathElement {
	PNDPathElementType type;
	CGPoint points[3];
} PNDPathElement;

extern CGPathRef PNDPathCreateWithElements(const PNDPathElement elements[], size_t count, const CGAffineTransform *transform);
