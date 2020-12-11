//
//  MediaLibraryViewController.m
//  TZImagePickerController
//
//  Created by windorz on 2020/12/11.
//  Copyright © 2020 谭真. All rights reserved.
//

#import "MediaLibraryViewController.h"
#import "TZImagePickerController.h"

@interface MediaLibraryViewController () <TZImagePickerControllerDelegate>

@end

@implementation MediaLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *presentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    presentBtn.frame = CGRectMake(0, 0, 100, 100);
    presentBtn.center = self.view.center;
    [presentBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [presentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:presentBtn];
    [presentBtn addTarget:self action:@selector(presentBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

// 跳转到 相册控制器
- (void)presentBtnClicked:(UIButton *)btn {
    
    // 默认设置 64 个
    // pushPhotoPickerVc 是不是直接 push 到 相册视图
    TZImagePickerController *imageVC = [[TZImagePickerController alloc] initWithMaxImagesCount:MAXINTERP columnNumber:3 delegate:self pushPhotoPickerVc:YES];
    // 运行图片和视频一起多选
    imageVC.allowPickingMultipleVideo = YES;
    // 资源时间逆序排序
    imageVC.sortAscendingByModificationDate = NO;
    // 隐藏底部的预览按钮, 用户则不能选取后进行预览
    imageVC.allowPreview = NO;
    // 取出选择原图按钮
    imageVC.allowPickingOriginalPhoto = NO;
    // 自定义返回按钮样式
//    imageVC.navLeftBarButtonSettingBlock = ^(UIButton *leftButton) {
//
//    };
    // 自定义导航栏和底部展示栏, 后续还有 FTP url 来浏览图片.
    // PhotoPickerController 变成一个单独的视图. 放置在 PhotoPickerController 上层
    // 自定义导航栏 titleView 还有就是单独拿出 PhotoPickerController.
    // 通过 block 将每个控件传出, 但是不能自定义, 只能通过修改控件的各个属性, 这样还不行, 需要深入控制器进行自定义.
    imageVC.photoPickerPageUIConfigBlock = ^(UICollectionView *collectionView, UIView *bottomToolBar, UIButton *previewButton, UIButton *originalPhotoButton, UILabel *originalPhotoLabel, UIButton *doneButton, UIImageView *numberImageView, UILabel *numberLabel, UIView *divideLine) {
    };
    
    [imageVC setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"photos: %@\n assets: %@", photos, assets);
    }];

    imageVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imageVC animated:YES completion:nil];
    
    
    
}



//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    TZImagePickerController *imageVC = [[TZImagePickerController alloc] initWithMaxImagesCount:-1 delegate:self];
//
//
//
//
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
