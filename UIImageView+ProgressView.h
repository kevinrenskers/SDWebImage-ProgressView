//
//  UIImageView+ProgressView.h
//
//  Created by Kevin Renskers on 07-06-13.
//  Copyright (c) 2013 Kevin Renskers. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>

@interface UIImageView (ProgressView)

- (void)sd_setImageWithURL:(NSURL *)url usingProgressView:(UIProgressView *)progressView;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingProgressView:(UIProgressView *)progressView;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingProgressView:(UIProgressView *)progressView;
- (void)sd_setImageWithURL:(NSURL *)url completed:(SDExternalCompletionBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDExternalCompletionBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDExternalCompletionBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)removeProgressView;

@end
