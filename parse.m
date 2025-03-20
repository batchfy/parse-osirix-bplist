#import <Cocoa/Cocoa.h>
//#import <OsiriXAPI/ROI.h>


@interface MyPoint : NSObject<NSCoding> {
    NSPoint pt;
}
@property(assign) NSPoint point;
@property(readonly) double x, y;
@end
@implementation MyPoint
@synthesize point = pt;
- (double)x {
    return pt.x;
}
- (double)y {
    return pt.y;
}
- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) return nil;
    // 从 NSString 解码 NSPoint
    pt = NSPointFromString([decoder decodeObject]);
    return self;
}
- (void)encodeWithCoder:(NSCoder *)encoder {
    // 将 NSPoint 编码为 NSString
    [encoder encodeObject:NSStringFromPoint(pt)];
}
@end



// Enum definitions copied from original header
typedef enum ROI_mode_ {
    ROI_sleep = 0,
    ROI_drawing = 1,
    ROI_selected = 2,
    ROI_selectedModify = 3
} ROI_mode;

typedef enum regionCode_ {
    regionCode_None = 0,
    regionCode_percentage,
    regionCode_dB,
    regionCode_cm,
    regionCode_second,
    regionCode_herz,
    regionCode_dbsec,
    regionCode_cmsec,
    regionCode_cm2,
    regionCode_cm2sec,
    regionCode_cm3,
    regionCode_cm3dsec
} regionCode;

typedef enum ToolMode_ {
    tIdle = -1,
    tWL = 0,
    tTranslate,          // 1
    tZoom,               // 2
    tRotate,            // 3
    tNext,              // 4
    tMesure,            // 5
    tROI,               // 6
    t3DRotate,          // 7
    tCross,             // 8
    tOval,              // 9
    tOPolygon,          // 10
    tCPolygon,          // 11
    tAngle,             // 12
    tText,              // 13
    tArrow,             // 14
    tPencil,            // 15
    t3Dpoint,           // 16
    t3DCut,             // 17
    tCamera3D,          // 18
    t2DPoint,           // 19
    tPlain,             // 20
    tBonesRemoval,      // 21
    tWLBlended,         // 22
    tRepulsor,          // 23
    tLayerROI,          // 24
    tROISelector,       // 25
    tAxis,              // 26
    tDynAngle,          // 27
    tCurvedROI,         // 28
    tTAGT,              // 29
    tBall,              // 30
    tOvalAngle,         // 31
    tAutoCurvedROI,     // 32
    t3DPosition,        // 33
    tMagicFill          // 34
} ToolMode;

typedef struct RGBAColor {
    float red;
    float green;
    float blue;
    float alpha;
} RGBAColor;

//typedef struct RGBColor {
//    unsigned short red;
//    unsigned short green;
//    unsigned short blue;
//} RGBColor;

@interface ROI : NSObject <NSCoding>

// Properties
@property (nonatomic, retain) NSMutableArray<MyPoint *> *points;
@property (nonatomic, retain) NSMutableArray<NSNumber *> *zPositions;
@property (nonatomic, retain) NSMutableArray<NSString *> *stringTags;
@property (nonatomic, retain) NSMutableArray *ctxArray;
@property (nonatomic, retain) NSMutableArray *textArray;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *comments;
@property (nonatomic, retain) NSString *savedStudyInstanceUID;
@property (nonatomic, retain) NSString *UUID;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *layerReferenceFilePath;
@property (nonatomic, retain) NSImage *layerImage;
@property (nonatomic, retain) NSData *layerImageJPEG;
@property (nonatomic, retain) NSColor *layerColor;
@property (nonatomic, retain) NSDate *creationDate;
@property (nonatomic, retain) NSDate *modificationDate;

@property (nonatomic, retain) NSString *textualBoxLine1;
@property (nonatomic, retain) NSString *textualBoxLine2;
@property (nonatomic, retain) NSString *textualBoxLine3;
@property (nonatomic, retain) NSString *textualBoxLine4;
@property (nonatomic, retain) NSString *textualBoxLine5;
@property (nonatomic, retain) NSString *textualBoxLine6;
@property (nonatomic, retain) NSString *textualBoxLine7;
@property (nonatomic, retain) NSString *textualBoxLine8;
@property (nonatomic, retain) NSString *textualBoxLine9;
@property (nonatomic, retain) NSString *textualBoxLine10;

@property (nonatomic) NSRect rect;
@property (nonatomic) NSPoint imageOrigin;
@property (nonatomic) NSPoint previousPoint;
@property (nonatomic) NSPoint clickPoint;

@property (nonatomic) float thickness;
@property (nonatomic) float opacity;
@property (nonatomic) float offsetTextBox_x;
@property (nonatomic) float offsetTextBox_y;
@property (nonatomic) float pixelSpacingX;
@property (nonatomic) float pixelSpacingY;
@property (nonatomic) float mousePosMeasure;
@property (nonatomic) float ovalAngle1;
@property (nonatomic) float ovalAngle2;
@property (nonatomic) float roiRotation;
@property (nonatomic) float zLocation;
@property (nonatomic) float preferredWL;
@property (nonatomic) float preferredWW;
@property (nonatomic) float layerPixelSpacingX;
@property (nonatomic) float layerPixelSpacingY;

@property (nonatomic) int textureWidth;
@property (nonatomic) int textureHeight;
@property (nonatomic) int textureUpLeftCornerX;
@property (nonatomic) int textureUpLeftCornerY;
@property (nonatomic) int textureDownRightCornerX;
@property (nonatomic) int textureDownRightCornerY;
@property (nonatomic) int pointUnderMouse;
@property (nonatomic) int originalIndexForAlias;
@property (nonatomic) int _calciumThreshold;
@property (nonatomic) void *textureBuffer;

@property (nonatomic) long selectedModifyPoint;

@property (nonatomic) double creationTimeStamp;
@property (nonatomic) double groupID;

@property (nonatomic) BOOL needQuartz;
@property (nonatomic) BOOL fill;
@property (nonatomic) BOOL clickInTextBox;
@property (nonatomic) BOOL locked;
@property (nonatomic) BOOL selectable;
@property (nonatomic) BOOL isAliased;
@property (nonatomic) BOOL displayTextualData;
@property (nonatomic) BOOL mouseOverROI;
@property (nonatomic) BOOL canColorizeLayer;
@property (nonatomic) BOOL isLayerOpacityConstant;
@property (nonatomic) BOOL canResizeLayer;
@property (nonatomic) BOOL _displayCalciumScoring;
@property (nonatomic) BOOL _hasIsSpline;
@property (nonatomic) BOOL _isSpline;
@property (nonatomic) BOOL dontDisplayInKeyImagesWindow;
@property (nonatomic) BOOL dontSavePreferredWLWW;
@property (nonatomic) BOOL is3DMeasure;
@property (nonatomic) BOOL textNameOnly;

@property (nonatomic) ToolMode type;
@property (nonatomic) ROI_mode mode;
@property (nonatomic) ROI_mode previousMode;
@property (nonatomic) RGBColor color;

// Class methods, return ROI or NSArray<ROI>
+ (id)unarchiveObjectWithData:(NSData *)data;
+ (id)unarchiveObjectWithFile:(NSString *)path;

@end



@implementation ROI

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (!self) return nil;

    if ([coder isKindOfClass:[NSKeyedUnarchiver class]]) {
        // Use NSKeyedUnarchiver format
        self.points = [coder decodeObjectForKey:@"points"];
        self.rect = [coder decodeRectForKey:@"rect"];
        self.type = (ToolMode)[coder decodeFloatForKey:@"type"];
        self.needQuartz = [coder decodeFloatForKey:@"needQuartz"] != 0;
        self.thickness = [coder decodeFloatForKey:@"thickness"];
        self.fill = [coder decodeFloatForKey:@"fill"] != 0;
        self.opacity = [coder decodeFloatForKey:@"opacity"];
        
        // Decode color
        self->_color.red = (unsigned short)[coder decodeFloatForKey:@"color.red"];
        self->_color.green = (unsigned short)[coder decodeFloatForKey:@"color.green"];
        self->_color.blue = (unsigned short)[coder decodeFloatForKey:@"color.blue"];
        
        self.name = [coder decodeObjectForKey:@"name"];
        self.comments = [coder decodeObjectForKey:@"comments"];
        self.pixelSpacingX = [coder decodeFloatForKey:@"pixelSpacingX"];
        self.imageOrigin = [coder decodePointForKey:@"imageOrigin"];
        
        if ([coder containsValueForKey:@"pixelSpacingY"]) {
            self.pixelSpacingY = [coder decodeFloatForKey:@"pixelSpacingY"];
        } else {
            self.pixelSpacingY = self.pixelSpacingX;
        }
        
        // Handle plain ROI texture data
        if (self.type == tPlain) {
            self.textureWidth = [coder decodeIntForKey:@"textureWidth"];
            self.textureHeight = [coder decodeIntForKey:@"textureHeight"];
            self.textureUpLeftCornerX = [coder decodeIntForKey:@"textureUpLeftCornerX"];
            self.textureUpLeftCornerY = [coder decodeIntForKey:@"textureUpLeftCornerY"];
            self.textureDownRightCornerX = [coder decodeIntForKey:@"textureDownRightCornerX"];
            self.textureDownRightCornerY = [coder decodeIntForKey:@"textureDownRightCornerY"];
            
            NSData *textureData = [coder decodeObjectForKey:@"textureBuffer"];
            if (textureData) {
                self->_textureBuffer = malloc(self.textureHeight * self.textureWidth);
                memcpy(self->_textureBuffer, textureData.bytes, self.textureHeight * self.textureWidth);
            }
        }
        
        // Decode z positions array
        if ([coder containsValueForKey:@"zPositions"]) {
            self.zPositions = [coder decodeObjectForKey:@"zPositions"];
        } else {
            self.zPositions = [NSMutableArray array];
        }
        
        // Decode text box offsets
        self.offsetTextBox_x = [coder decodeFloatForKey:@"offsetTextBox_x"];
        self.offsetTextBox_y = [coder decodeFloatForKey:@"offsetTextBox_y"];
        
        // Decode calcium scoring
        self._calciumThreshold = [coder decodeIntForKey:@"_calciumThreshold"];
        self._displayCalciumScoring = [coder decodeBoolForKey:@"_displayCalciumScoring"];
        
        // Decode group ID
        self.groupID = [coder decodeDoubleForKey:@"groupID"];
        
        // Handle layer ROI data
        if (self.type == tLayerROI) {
            self.layerImageJPEG = [coder decodeObjectForKey:@"layerImageJPEG"];
            self.layerImage = [[NSImage alloc] initWithData:self.layerImageJPEG];
        }
        
        // Decode textual box lines
        self.textualBoxLine1 = [coder decodeObjectForKey:@"textualBoxLine1"];
        self.textualBoxLine2 = [coder decodeObjectForKey:@"textualBoxLine2"];
        self.textualBoxLine3 = [coder decodeObjectForKey:@"textualBoxLine3"];
        self.textualBoxLine4 = [coder decodeObjectForKey:@"textualBoxLine4"];
        self.textualBoxLine5 = [coder decodeObjectForKey:@"textualBoxLine5"];
        self.textualBoxLine6 = [coder decodeObjectForKey:@"textualBoxLine6"];
        self.textualBoxLine7 = [coder decodeObjectForKey:@"textualBoxLine7"];
        self.textualBoxLine8 = [coder decodeObjectForKey:@"textualBoxLine8"];
        self.textualBoxLine9 = [coder decodeObjectForKey:@"textualBoxLine9"];
        
        // Decode layer properties
        self.isLayerOpacityConstant = [coder decodeBoolForKey:@"isLayerOpacityConstant"];
        self.canColorizeLayer = [coder decodeBoolForKey:@"canColorizeLayer"];
        self.layerColor = [coder decodeObjectForKey:@"layerColor"];
        
        // Decode display properties
        if ([coder containsValueForKey:@"displayTextualData"]) {
            self.displayTextualData = [coder decodeBoolForKey:@"displayTextualData"];
        } else {
            self.displayTextualData = YES;
        }
        
        self.canResizeLayer = [coder decodeBoolForKey:@"canResizeLayer"];
        
        if ([coder containsValueForKey:@"selectable"]) {
            self.selectable = [coder decodeBoolForKey:@"selectable"];
        } else {
            self.selectable = YES;
        }
        
        self.locked = [coder decodeBoolForKey:@"locked"];
        self.isAliased = [coder decodeBoolForKey:@"isAliased"];
        self._isSpline = [coder decodeBoolForKey:@"_isSpline"];
        self._hasIsSpline = [coder decodeBoolForKey:@"_hasIsSpline"];
        
        // Decode study instance UID
        self.savedStudyInstanceUID = [[coder decodeObjectForKey:@"savedStudyInstanceUID"] copy];
        
        // Handle oval angles for oval ROI type
        if (self.type == tOvalAngle) {
            self.ovalAngle1 = [coder decodeFloatForKey:@"ovalAngle1"];
            self.ovalAngle2 = [coder decodeFloatForKey:@"ovalAngle2"];
        }
        
        // Decode rotation and z location
        self.roiRotation = [coder decodeFloatForKey:@"roiRotation"];
        if ([coder containsValueForKey:@"zLocation"]) {
            self.zLocation = [coder decodeFloatForKey:@"zLocation"];
        }
        
        // Decode string tags and display flags
        self.stringTags = [[coder decodeObjectForKey:@"stringTags"] mutableCopy];
        self.dontDisplayInKeyImagesWindow = [coder decodeBoolForKey:@"dontDisplayInKeyImagesWindow"];
        
        // Decode window level/width preferences
        self.preferredWL = [coder decodeFloatForKey:@"preferredWL"];
        self.preferredWW = [coder decodeFloatForKey:@"preferredWW"];
        self.dontSavePreferredWLWW = [coder decodeBoolForKey:@"dontSavePreferredWLWW"];
        
        // Decode measurement flags
        self.is3DMeasure = [coder decodeBoolForKey:@"is3DMeasure"];
        
        // Decode metadata
        self.UUID = [coder decodeObjectForKey:@"UUID"];
        self.username = [coder decodeObjectForKey:@"username"];
        self.creationDate = [coder decodeObjectForKey:@"creationDate"];
        self.modificationDate = [coder decodeObjectForKey:@"modificationDate"];
        self.textNameOnly = [coder decodeBoolForKey:@"textNameOnly"];
        
        self.originalIndexForAlias = [coder decodeIntForKey:@"originalIndexForAlias"];
        
    } else {
        // Legacy unarchive format (not implemented)
        NSLog(@"Legacy unarchive format not supported");
        return nil;
    }
    
    // Initialize other properties
    self.mode = ROI_sleep;
    self.previousPoint = NSMakePoint(-1000, -1000);
    self.mousePosMeasure = -1;
    self.ctxArray = [NSMutableArray arrayWithCapacity:10];
    self.textArray = [NSMutableArray arrayWithCapacity:10];
    
    if (!self.stringTags) {
        self.stringTags = [NSMutableArray arrayWithCapacity:10];
    }
    
    if (!self.creationTimeStamp) {
        self.creationTimeStamp = [NSDate timeIntervalSinceReferenceDate];
    }
    
    return self;
}

- (NSDictionary *)toJSONDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 基本属性
    dict[@"type"] = @(self.type);
    dict[@"name"] = self.name ?: @"";
    dict[@"comments"] = self.comments ?: @"";
    dict[@"rect"] = @{
        @"x": @(self.rect.origin.x),
        @"y": @(self.rect.origin.y),
        @"width": @(self.rect.size.width),
        @"height": @(self.rect.size.height)
    };
    
    // 点数组
    NSMutableArray *pointsArray = [NSMutableArray array];
    for (MyPoint *point in self.points) {
        [pointsArray addObject:@{
            @"x": @(point.x),
            @"y": @(point.y)
        }];
    }
    dict[@"points"] = pointsArray;
    
    // 颜色
    dict[@"color"] = @{
        @"red": @(self.color.red),
        @"green": @(self.color.green),
        @"blue": @(self.color.blue)
    };
    
    // 图层属性
    dict[@"thickness"] = @(self.thickness);
    dict[@"opacity"] = @(self.opacity);
    dict[@"fill"] = @(self.fill);
    dict[@"needQuartz"] = @(self.needQuartz);
    
    // 空间属性
    dict[@"pixelSpacingX"] = @(self.pixelSpacingX);
    dict[@"pixelSpacingY"] = @(self.pixelSpacingY);
    dict[@"imageOrigin"] = @{
        @"x": @(self.imageOrigin.x),
        @"y": @(self.imageOrigin.y)
    };
    dict[@"zLocation"] = @(self.zLocation);
    
    // ROI 状态
    dict[@"locked"] = @(self.locked);
    dict[@"selectable"] = @(self.selectable);
    dict[@"displayTextualData"] = @(self.displayTextualData);
    
    // 文本框
    dict[@"textualBoxLines"] = @{
        @"line1": self.textualBoxLine1 ?: @"",
        @"line2": self.textualBoxLine2 ?: @"",
        @"line3": self.textualBoxLine3 ?: @"",
        @"line4": self.textualBoxLine4 ?: @"",
        @"line5": self.textualBoxLine5 ?: @"",
        @"line6": self.textualBoxLine6 ?: @"",
        @"line7": self.textualBoxLine7 ?: @"",
        @"line8": self.textualBoxLine8 ?: @"",
        @"line9": self.textualBoxLine9 ?: @"",
        @"line10": self.textualBoxLine10 ?: @""
    };
    
    // 元数据
    dict[@"UUID"] = self.UUID ?: @"";
    dict[@"username"] = self.username ?: @"";
    dict[@"creationDate"] = self.creationDate ? [self.creationDate description] : @"";
    dict[@"modificationDate"] = self.modificationDate ? [self.modificationDate description] : @"";
    dict[@"creationTimeStamp"] = @(self.creationTimeStamp);
    
    return dict;
}

#pragma mark - Class Methods

+ (id)unarchiveObjectWithData:(NSData *)data {
    if (!data.length) return nil;
    
    // Try NSKeyedUnarchiver first
    id obj = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (obj) return obj;
    
    // Try checking for legacy format
    char lastByte;
    [data getBytes:&lastByte range:NSMakeRange(data.length - 1, 1)];
    if (lastByte) {
        // Try NSUnarchiver
        return [NSUnarchiver unarchiveObjectWithData:data];
    }
    
    // Try NSKeyedUnarchiver without last byte
    NSData *truncatedData = [data subdataWithRange:NSMakeRange(0, data.length - 1)];
    obj = [NSKeyedUnarchiver unarchiveObjectWithData:truncatedData];
    if (obj) return obj;
    
    // Try NSUnarchiver as last resort
    return [NSUnarchiver unarchiveObjectWithData:data];
}

+ (id)unarchiveObjectWithFile:(NSString *)path {
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [self unarchiveObjectWithData:data];
}

@end






int main(int argc, const char * argv[]) {
    if (argc != 2) {
        printf("Usage: %s <roi_file_path>\n", argv[0]);
        return 1;
    }
    
    NSString *path = [NSString stringWithUTF8String:argv[1]];
    ROI *roi = [ROI unarchiveObjectWithFile:path];
    if ([roi isKindOfClass:NSArray.class]) {
        roi = [(NSArray *)roi firstObject];
    }
    
    if (!roi) {
        printf("Failed to load ROI file.\n");
        return 1;
    }
    
    // 转换为 JSON 并打印
    NSDictionary *jsonDict = [roi toJSONDictionary];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                                      options:NSJSONWritingPrettyPrinted
                                                        error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    printf("%s\n", [jsonString UTF8String]);
    
    return 0;
}
