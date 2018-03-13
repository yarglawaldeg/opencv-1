Pod::Spec.new do |s|
    s.name             = 'opencv'
    s.version          = '3.1.1'
    s.summary          = 'OpenCV (Computer Vision) for iOS as a dynamic library.'

    s.description      = <<-DESC
OpenCV: open source computer vision library
    Homepage: http://opencv.org
    Online docs: http://docs.opencv.org
    Q&A forum: http://answers.opencv.org
    Dev zone: http://code.opencv.org
    DESC

    s.homepage         = 'https://github.com/yarglawaldeg/opencv'
    s.license          = { :type => '3-clause BSD', :file => 'LICENSE' }
    s.authors          = 'opencv.org'
    s.source           = { :git => 'https://github.com/yarglawaldeg/opencv.git', :tag => s.version.to_s }

    s.ios.deployment_target = "8.0"
    s.source_files = "install/include/**/*{.h,.hpp}"
    s.public_header_files = "install/include/**/*{.h,.hpp}"
    s.preserve_paths = "install"
    s.header_mappings_dir = "install/include"
    s.vendored_libraries = "install/lib/libopencv2.dylib"
    s.requires_arc = false
    s.libraries = [ 'stdc++' ]
    s.frameworks = [
        "Accelerate",
        "AssetsLibrary",
        "AVFoundation",
        "CoreGraphics",
        "CoreImage",
        "CoreMedia",
        "CoreVideo",
        "Foundation",
        "QuartzCore",
        "UIKit"
    ]

    s.prepare_command = <<-CMD
        python opencv/platforms/ios/build_framework.py ios
    CMD
end
