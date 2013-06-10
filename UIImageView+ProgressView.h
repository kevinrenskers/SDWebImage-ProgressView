//
//  UIImageView+ProgressView.h
//
//  Created by Kevin Renskers on 07-06-13.
//  Copyright (c) 2013 Kevin Renskers. All rights reserved.
//

#import "UIImageView+WebCache.h"

@interface UIImageView (ProgressView)

- (void)setImageWithURL:(NSURL *)url usingProgressView:(UIProgressView *)progressView;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingProgressView:(UIProgressView *)progressView;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingProgressView:(UIProgressView *)progressView;
- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock usingProgressView:(UIProgressView *)progressView;
- (void)removeProgressView;

@end
