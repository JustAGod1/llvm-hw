; ModuleID = 'game.c'
source_filename = "game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define dso_local void @drawGen(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %1, %16
  %3 = phi i64 [ 0, %1 ], [ %17, %16 ]
  %4 = shl i64 %3, 9
  %5 = trunc i64 %3 to i32
  br label %6

6:                                                ; preds = %2, %6
  %7 = phi i64 [ 0, %2 ], [ %14, %6 ]
  %8 = add nuw nsw i64 %7, %4
  %9 = getelementptr inbounds i32, ptr %0, i64 %8
  %10 = load i32, ptr %9, align 4, !tbaa !5
  %11 = mul i32 %10, 65280
  %12 = add i32 %11, -16777216
  %13 = trunc i64 %7 to i32
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %5, i32 noundef %12) #4
  %14 = add nuw nsw i64 %7, 1
  %15 = icmp eq i64 %14, 512
  br i1 %15, label %16, label %6, !llvm.loop !9

16:                                               ; preds = %6
  %17 = add nuw nsw i64 %3, 1
  %18 = icmp eq i64 %17, 256
  br i1 %18, label %19, label %2, !llvm.loop !11

19:                                               ; preds = %16
  tail call void (...) @simFlush() #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

declare void @simFlush(...) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @calcGen(ptr nocapture noundef writeonly %0, ptr nocapture noundef readonly %1) local_unnamed_addr #3 {
  br label %3

3:                                                ; preds = %2, %23
  %4 = phi i64 [ 0, %2 ], [ %24, %23 ]
  %5 = trunc i64 %4 to i32
  %6 = add i32 %5, -511
  %7 = icmp ult i32 %6, -512
  %8 = add nuw nsw i64 %4, 513
  %9 = and i64 %4, 4294966784
  %10 = icmp ne i64 %9, 0
  %11 = add nuw nsw i64 %4, 512
  %12 = trunc i64 %4 to i32
  %13 = add i32 %12, -513
  %14 = icmp ult i32 %13, -512
  %15 = add nuw nsw i64 %4, 511
  br label %17

16:                                               ; preds = %23
  ret void

17:                                               ; preds = %3, %128
  %18 = phi i64 [ 0, %3 ], [ %136, %128 ]
  %19 = trunc i64 %18 to i32
  %20 = add i32 %19, -255
  %21 = icmp ult i32 %20, -256
  %22 = select i1 %7, i1 true, i1 %21
  br i1 %22, label %33, label %26

23:                                               ; preds = %128
  %24 = add nuw nsw i64 %4, 1
  %25 = icmp eq i64 %24, 512
  br i1 %25, label %16, label %3, !llvm.loop !12

26:                                               ; preds = %17
  %27 = shl nsw i64 %18, 9
  %28 = add nuw nsw i64 %8, %27
  %29 = getelementptr inbounds i32, ptr %1, i64 %28
  %30 = load i32, ptr %29, align 4, !tbaa !5
  %31 = icmp ne i32 %30, 0
  %32 = zext i1 %31 to i32
  br label %33

33:                                               ; preds = %17, %26
  %34 = phi i32 [ %32, %26 ], [ 0, %17 ]
  %35 = add nsw i64 %18, -1
  %36 = and i64 %18, 4294967040
  %37 = icmp ne i64 %36, 0
  %38 = select i1 %7, i1 true, i1 %37
  br i1 %38, label %47, label %39

39:                                               ; preds = %33
  %40 = shl nsw i64 %35, 9
  %41 = add nsw i64 %8, %40
  %42 = getelementptr inbounds i32, ptr %1, i64 %41
  %43 = load i32, ptr %42, align 4, !tbaa !5
  %44 = icmp ne i32 %43, 0
  %45 = zext i1 %44 to i32
  %46 = add nuw nsw i32 %34, %45
  br label %47

47:                                               ; preds = %39, %33
  %48 = phi i32 [ %46, %39 ], [ %34, %33 ]
  %49 = add nsw i64 %18, -2
  %50 = trunc i64 %18 to i32
  %51 = add i32 %50, -257
  %52 = icmp ult i32 %51, -256
  %53 = select i1 %7, i1 true, i1 %52
  br i1 %53, label %62, label %54

54:                                               ; preds = %47
  %55 = shl nsw i64 %49, 9
  %56 = add nsw i64 %8, %55
  %57 = getelementptr inbounds i32, ptr %1, i64 %56
  %58 = load i32, ptr %57, align 4, !tbaa !5
  %59 = icmp ne i32 %58, 0
  %60 = zext i1 %59 to i32
  %61 = add nuw nsw i32 %48, %60
  br label %62

62:                                               ; preds = %54, %47
  %63 = phi i32 [ %61, %54 ], [ %48, %47 ]
  %64 = select i1 %10, i1 true, i1 %21
  br i1 %64, label %73, label %65

65:                                               ; preds = %62
  %66 = shl nsw i64 %18, 9
  %67 = add nuw nsw i64 %11, %66
  %68 = getelementptr inbounds i32, ptr %1, i64 %67
  %69 = load i32, ptr %68, align 4, !tbaa !5
  %70 = icmp ne i32 %69, 0
  %71 = zext i1 %70 to i32
  %72 = add nuw nsw i32 %63, %71
  br label %73

73:                                               ; preds = %65, %62
  %74 = phi i32 [ %72, %65 ], [ %63, %62 ]
  %75 = select i1 %10, i1 true, i1 %37
  br i1 %75, label %84, label %76

76:                                               ; preds = %73
  %77 = shl nsw i64 %35, 9
  %78 = add nsw i64 %11, %77
  %79 = getelementptr inbounds i32, ptr %1, i64 %78
  %80 = load i32, ptr %79, align 4, !tbaa !5
  %81 = icmp ne i32 %80, 0
  %82 = zext i1 %81 to i32
  %83 = add nuw nsw i32 %74, %82
  br label %84

84:                                               ; preds = %76, %73
  %85 = phi i32 [ %83, %76 ], [ %74, %73 ]
  %86 = select i1 %10, i1 true, i1 %52
  br i1 %86, label %95, label %87

87:                                               ; preds = %84
  %88 = shl nsw i64 %49, 9
  %89 = add nsw i64 %11, %88
  %90 = getelementptr inbounds i32, ptr %1, i64 %89
  %91 = load i32, ptr %90, align 4, !tbaa !5
  %92 = icmp ne i32 %91, 0
  %93 = zext i1 %92 to i32
  %94 = add nuw nsw i32 %85, %93
  br label %95

95:                                               ; preds = %87, %84
  %96 = phi i32 [ %94, %87 ], [ %85, %84 ]
  %97 = select i1 %14, i1 true, i1 %21
  br i1 %97, label %106, label %98

98:                                               ; preds = %95
  %99 = shl nsw i64 %18, 9
  %100 = add nuw nsw i64 %15, %99
  %101 = getelementptr inbounds i32, ptr %1, i64 %100
  %102 = load i32, ptr %101, align 4, !tbaa !5
  %103 = icmp ne i32 %102, 0
  %104 = zext i1 %103 to i32
  %105 = add nuw nsw i32 %96, %104
  br label %106

106:                                              ; preds = %98, %95
  %107 = phi i32 [ %105, %98 ], [ %96, %95 ]
  %108 = select i1 %14, i1 true, i1 %37
  br i1 %108, label %117, label %109

109:                                              ; preds = %106
  %110 = shl nsw i64 %35, 9
  %111 = add nsw i64 %15, %110
  %112 = getelementptr inbounds i32, ptr %1, i64 %111
  %113 = load i32, ptr %112, align 4, !tbaa !5
  %114 = icmp ne i32 %113, 0
  %115 = zext i1 %114 to i32
  %116 = add nuw nsw i32 %107, %115
  br label %117

117:                                              ; preds = %109, %106
  %118 = phi i32 [ %116, %109 ], [ %107, %106 ]
  %119 = select i1 %14, i1 true, i1 %52
  br i1 %119, label %128, label %120

120:                                              ; preds = %117
  %121 = shl nsw i64 %49, 9
  %122 = add nsw i64 %15, %121
  %123 = getelementptr inbounds i32, ptr %1, i64 %122
  %124 = load i32, ptr %123, align 4, !tbaa !5
  %125 = icmp ne i32 %124, 0
  %126 = zext i1 %125 to i32
  %127 = add nuw nsw i32 %118, %126
  br label %128

128:                                              ; preds = %120, %117
  %129 = phi i32 [ %127, %120 ], [ %118, %117 ]
  %130 = add nsw i32 %129, -3
  %131 = icmp ult i32 %130, 2
  %132 = zext i1 %131 to i32
  %133 = shl nsw i64 %18, 9
  %134 = add nuw nsw i64 %133, %4
  %135 = getelementptr inbounds i32, ptr %0, i64 %134
  store i32 %132, ptr %135, align 4, !tbaa !5
  %136 = add nuw nsw i64 %18, 1
  %137 = icmp eq i64 %136, 256
  br i1 %137, label %23, label %17, !llvm.loop !13
}

; Function Attrs: nounwind sspstrong uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [131072 x i32], align 16
  %2 = alloca [131072 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 524288, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 524288, ptr nonnull %2) #4
  br label %3

3:                                                ; preds = %0, %14
  %4 = phi i64 [ 0, %0 ], [ %15, %14 ]
  %5 = shl i64 %4, 9
  br label %6

6:                                                ; preds = %3, %6
  %7 = phi i64 [ 0, %3 ], [ %12, %6 ]
  %8 = tail call i32 (...) @simRand() #4
  %9 = srem i32 %8, 2
  %10 = add nuw nsw i64 %7, %5
  %11 = getelementptr inbounds i32, ptr %2, i64 %10
  store i32 %9, ptr %11, align 4, !tbaa !5
  %12 = add nuw nsw i64 %7, 1
  %13 = icmp eq i64 %12, 512
  br i1 %13, label %14, label %6, !llvm.loop !14

14:                                               ; preds = %6
  %15 = add nuw nsw i64 %4, 1
  %16 = icmp eq i64 %15, 256
  br i1 %16, label %17, label %3, !llvm.loop !15

17:                                               ; preds = %14, %31
  %18 = phi i64 [ %32, %31 ], [ 0, %14 ]
  %19 = shl i64 %18, 9
  %20 = trunc i64 %18 to i32
  br label %21

21:                                               ; preds = %21, %17
  %22 = phi i64 [ 0, %17 ], [ %29, %21 ]
  %23 = add nuw nsw i64 %22, %19
  %24 = getelementptr inbounds i32, ptr %2, i64 %23
  %25 = load i32, ptr %24, align 4, !tbaa !5
  %26 = mul i32 %25, 65280
  %27 = add i32 %26, -16777216
  %28 = trunc i64 %22 to i32
  tail call void @simPutPixel(i32 noundef %28, i32 noundef %20, i32 noundef %27) #4
  %29 = add nuw nsw i64 %22, 1
  %30 = icmp eq i64 %29, 512
  br i1 %30, label %31, label %21, !llvm.loop !9

31:                                               ; preds = %21
  %32 = add nuw nsw i64 %18, 1
  %33 = icmp eq i64 %32, 256
  br i1 %33, label %34, label %17, !llvm.loop !11

34:                                               ; preds = %31
  tail call void (...) @simFlush() #4
  br label %35

35:                                               ; preds = %34, %56
  %36 = phi ptr [ %2, %34 ], [ %37, %56 ]
  %37 = phi ptr [ %1, %34 ], [ %36, %56 ]
  %38 = phi i32 [ 0, %34 ], [ %57, %56 ]
  call void @calcGen(ptr noundef %37, ptr noundef nonnull %36)
  br label %39

39:                                               ; preds = %53, %35
  %40 = phi i64 [ 0, %35 ], [ %54, %53 ]
  %41 = shl i64 %40, 9
  %42 = trunc i64 %40 to i32
  br label %43

43:                                               ; preds = %43, %39
  %44 = phi i64 [ 0, %39 ], [ %51, %43 ]
  %45 = add nuw nsw i64 %44, %41
  %46 = getelementptr inbounds i32, ptr %37, i64 %45
  %47 = load i32, ptr %46, align 4, !tbaa !5
  %48 = mul i32 %47, 65280
  %49 = add i32 %48, -16777216
  %50 = trunc i64 %44 to i32
  tail call void @simPutPixel(i32 noundef %50, i32 noundef %42, i32 noundef %49) #4
  %51 = add nuw nsw i64 %44, 1
  %52 = icmp eq i64 %51, 512
  br i1 %52, label %53, label %43, !llvm.loop !9

53:                                               ; preds = %43
  %54 = add nuw nsw i64 %40, 1
  %55 = icmp eq i64 %54, 256
  br i1 %55, label %56, label %39, !llvm.loop !11

56:                                               ; preds = %53
  tail call void (...) @simFlush() #4
  %57 = add nuw nsw i32 %38, 1
  %58 = icmp eq i32 %57, 1024
  br i1 %58, label %59, label %35, !llvm.loop !16

59:                                               ; preds = %56
  call void @llvm.lifetime.end.p0(i64 524288, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 524288, ptr nonnull %1) #4
  ret void
}

declare i32 @simRand(...) local_unnamed_addr #2

attributes #0 = { nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 16.0.6"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
