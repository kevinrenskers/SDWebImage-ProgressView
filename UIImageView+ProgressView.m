//
//  UIImageView+ProgressView.m
//
//  Created by Kevin Renskers on 07-06-13.
//  Copyright (c) 2013 Kevin Renskers. All rights reserved.
//

#import "UIImageView+ProgressView.h"

#define TAG_PROGRESS_VIEW 149462

@implementation UIImageView (ProgressView)

- (void)addProgressView:(UIProgressView *)progressView {
    UIProgressView *existingProgressView = (UIProgressView *)[self viewWithTag:TAG_PROGRESS_VIEW];
    if (!existingProgressView) {
        if (!progressView) {
            progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        }

        progressView.tag = TAG_PROGRESS_VIEW;
        progressView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;

        float width = progressView.frame.size.width;
        float height = progressView.frame.size.height;
        float x = (self.frame.size.width / 2.0) - width/2;
        float y = (self.frame.size.height / 2.0) - height/2;
        progressView.frame = CGRectMake(x, y, width, height);

        [self addSubview:progressView];
    }
}

- (void)updateProgress:(CGFloat)progress {
    UIProgressView *progressView = (UIProgressView *)[self viewWithTag:TAG_PROGRESS_VIEW];
    if (progressView) {
        progressView.progress = progress;
    }
}

- (void)removeProgressView {
    UIProgressView *progressView = (UIProgressView *)[self viewWithTag:TAG_PROGRESS_VIEW];
    if (progressView) {
        [progressView removeFromSuperview];
    }
}

- (void)setImageWithURL:(NSURL *)url usingProgressView:(UIProgressView *)progressView {
    [self setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil usingProgressView:progressView];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingProgressView:(UIProgressView *)progressView {
    [self setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil usingProgressView:progressView];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingProgressView:(UIProgressView *)progressView{
    [self setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil usingProgressView:progressView];
}

- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView {
    [self setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock usingProgressView:progressView];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView {
    [self setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock usingProgressView:progressView];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView {
    [self setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock usingProgressView:progressView];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView {
    [self addProgressView:progressView];
    
    __weak typeof(self) weakSelf = self;

    [self setImageWithURL:url
         placeholderImage:placeholder
                  options:options
                 progress:^(NSUInteger receivedSize, long long expectedSize) {
                     CGFloat progress = ((CGFloat)receivedSize / (CGFloat)expectedSize);
                     [weakSelf updateProgress:progress];
                     if (progressBlock) {
                         progressBlock(receivedSize, expectedSize);
                     }
                 }
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    [weakSelf removeProgressView];
                    if (completedBlock) {
                        completedBlock(image, error, cacheType);
                    }
                }
     ];
}

@end
