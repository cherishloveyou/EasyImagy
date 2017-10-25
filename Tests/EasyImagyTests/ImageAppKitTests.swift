#if os(macOS)
    import XCTest
    import EasyImagy
    import CoreGraphics
    import AppKit
    
    class ImageAppKitTests: XCTestCase {
        func testNsImage() {
            do {
                let image = Image<RGBA<UInt8>>(width: 2, height: 2, pixels: [
                    RGBA<UInt8>(red: 0, green: 1, blue: 2, alpha: 255),
                    RGBA<UInt8>(red: 253, green: 254, blue: 255, alpha: 255),
                    RGBA<UInt8>(red: 10, green: 20, blue: 30, alpha: 102),
                    RGBA<UInt8>(red: 10, green: 20, blue: 30, alpha: 51),
                ])
                let nsImage = image.nsImage
                XCTAssertEqual(nsImage.size.width, CGFloat(image.width))
                XCTAssertEqual(nsImage.size.height, CGFloat(image.height))
                
                let restored = Image<RGBA<UInt8>>(nsImage: nsImage)!
                XCTAssertEqual(restored.width, image.width)
                XCTAssertEqual(restored.height, image.height)
                XCTAssertEqual(restored[0, 0], image[0, 0])
                XCTAssertEqual(restored[1, 0], image[1, 0])
                XCTAssertEqual(restored[0, 1], image[0, 1])
                XCTAssertEqual(restored[1, 1], image[1, 1])
            }
            
            do {
                let image = Image<UInt8>(width: 2, height: 2, pixels: [0, 1, 127, 255])
                let nsImage = image.nsImage
                XCTAssertEqual(nsImage.size.width, CGFloat(image.width))
                XCTAssertEqual(nsImage.size.height, CGFloat(image.height))
                
                let restored = Image<UInt8>(nsImage: nsImage)!
                XCTAssertEqual(restored.width, image.width)
                XCTAssertEqual(restored.height, image.height)
                XCTAssertEqual(restored[0, 0], image[0, 0])
                XCTAssertEqual(restored[1, 0], image[1, 0])
                XCTAssertEqual(restored[0, 1], image[0, 1])
                XCTAssertEqual(restored[1, 1], image[1, 1])
            }
        }
        
        func testNsImageTiffRepresentation() {
            do {
                let image = Image<RGBA<UInt8>>(width: 2, height: 2, pixels: [
                    RGBA<UInt8>(red: 0, green: 1, blue: 2, alpha: 255),
                    RGBA<UInt8>(red: 253, green: 254, blue: 255, alpha: 255),
                    RGBA<UInt8>(red: 10, green: 20, blue: 30, alpha: 102),
                    RGBA<UInt8>(red: 10, green: 20, blue: 30, alpha: 51),
                ])
                let nsImage = image.nsImage
                let data = nsImage.tiffRepresentation!
                
                let nsRestored = NSImage(data: data)!
                XCTAssertEqual(nsRestored.size.width, CGFloat(image.width))
                XCTAssertEqual(nsRestored.size.height, CGFloat(image.height))
                
                let restored = Image<RGBA<UInt8>>(nsImage: nsRestored)!
                XCTAssertEqual(restored.width, image.width)
                XCTAssertEqual(restored.height, image.height)
                XCTAssertEqual(restored[0, 0], image[0, 0])
                XCTAssertEqual(restored[1, 0], image[1, 0])
                XCTAssertEqual(restored[0, 1], image[0, 1])
                XCTAssertEqual(restored[1, 1], image[1, 1])
            }
            
            do {
                let image = Image<UInt8>(width: 2, height: 2, pixels: [0, 1, 127, 255])
                let nsImage = image.nsImage
                let data = nsImage.tiffRepresentation!
                
                let nsRestored = NSImage(data: data)!
                XCTAssertEqual(nsRestored.size.width, CGFloat(image.width))
                XCTAssertEqual(nsRestored.size.height, CGFloat(image.height))
                
                let restored = Image<UInt8>(nsImage: nsRestored)!
                XCTAssertEqual(restored.width, image.width)
                XCTAssertEqual(restored.height, image.height)
                XCTAssertEqual(restored[0, 0], image[0, 0])
                XCTAssertEqual(restored[1, 0], image[1, 0])
                XCTAssertEqual(restored[0, 1], image[0, 1])
                XCTAssertEqual(restored[1, 1], image[1, 1])
            }
        }
    }
#endif
