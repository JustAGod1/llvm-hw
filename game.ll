; ModuleID = 'game.c'
source_filename = "game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @drawGen(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %29, %1
  %6 = load i32, ptr %4, align 4
  %7 = icmp ult i32 %6, 256
  br i1 %7, label %8, label %32

8:                                                ; preds = %5
  store i32 0, ptr %3, align 4
  br label %9

9:                                                ; preds = %25, %8
  %10 = load i32, ptr %3, align 4
  %11 = icmp ult i32 %10, 512
  br i1 %11, label %12, label %28

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %4, align 4
  %17 = mul i32 %16, 512
  %18 = load i32, ptr %3, align 4
  %19 = add i32 %17, %18
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %15, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = mul i32 65280, %22
  %24 = add i32 -16777216, %23
  call void @simPutPixel(i32 noundef %13, i32 noundef %14, i32 noundef %24)
  br label %25

25:                                               ; preds = %12
  %26 = load i32, ptr %3, align 4
  %27 = add i32 %26, 1
  store i32 %27, ptr %3, align 4
  br label %9, !llvm.loop !6

28:                                               ; preds = %9
  br label %29

29:                                               ; preds = %28
  %30 = load i32, ptr %4, align 4
  %31 = add i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %5, !llvm.loop !8

32:                                               ; preds = %5
  call void (...) @simFlush()
  ret void
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) #1

declare void @simFlush(...) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @calcGen(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %12

12:                                               ; preds = %90, %2
  %13 = load i32, ptr %5, align 4
  %14 = icmp slt i32 %13, 512
  br i1 %14, label %15, label %93

15:                                               ; preds = %12
  store i32 0, ptr %6, align 4
  br label %16

16:                                               ; preds = %86, %15
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 256
  br i1 %18, label %19, label %89

19:                                               ; preds = %16
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %20

20:                                               ; preds = %67, %19
  %21 = load i32, ptr %8, align 4
  %22 = icmp slt i32 %21, 3
  br i1 %22, label %23, label %70

23:                                               ; preds = %20
  store i32 0, ptr %9, align 4
  br label %24

24:                                               ; preds = %63, %23
  %25 = load i32, ptr %9, align 4
  %26 = icmp slt i32 %25, 3
  br i1 %26, label %27, label %66

27:                                               ; preds = %24
  %28 = load i32, ptr %5, align 4
  %29 = load i32, ptr %8, align 4
  %30 = sub nsw i32 %28, %29
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %10, align 4
  %32 = load i32, ptr %6, align 4
  %33 = load i32, ptr %9, align 4
  %34 = sub nsw i32 %32, %33
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %11, align 4
  %36 = load i32, ptr %10, align 4
  %37 = icmp sge i32 %36, 512
  br i1 %37, label %41, label %38

38:                                               ; preds = %27
  %39 = load i32, ptr %10, align 4
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %41, label %42

41:                                               ; preds = %38, %27
  br label %63

42:                                               ; preds = %38
  %43 = load i32, ptr %11, align 4
  %44 = icmp sge i32 %43, 256
  br i1 %44, label %48, label %45

45:                                               ; preds = %42
  %46 = load i32, ptr %11, align 4
  %47 = icmp slt i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %45, %42
  br label %63

49:                                               ; preds = %45
  %50 = load ptr, ptr %4, align 8
  %51 = load i32, ptr %10, align 4
  %52 = load i32, ptr %11, align 4
  %53 = mul nsw i32 512, %52
  %54 = add nsw i32 %51, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %50, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %62

59:                                               ; preds = %49
  %60 = load i32, ptr %7, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %7, align 4
  br label %62

62:                                               ; preds = %59, %49
  br label %63

63:                                               ; preds = %62, %48, %41
  %64 = load i32, ptr %9, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %9, align 4
  br label %24, !llvm.loop !9

66:                                               ; preds = %24
  br label %67

67:                                               ; preds = %66
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %8, align 4
  br label %20, !llvm.loop !10

70:                                               ; preds = %20
  %71 = load i32, ptr %7, align 4
  %72 = icmp sge i32 %71, 3
  br i1 %72, label %73, label %76

73:                                               ; preds = %70
  %74 = load i32, ptr %7, align 4
  %75 = icmp sle i32 %74, 4
  br label %76

76:                                               ; preds = %73, %70
  %77 = phi i1 [ false, %70 ], [ %75, %73 ]
  %78 = zext i1 %77 to i32
  %79 = load ptr, ptr %3, align 8
  %80 = load i32, ptr %6, align 4
  %81 = mul nsw i32 %80, 512
  %82 = load i32, ptr %5, align 4
  %83 = add nsw i32 %81, %82
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, ptr %79, i64 %84
  store i32 %78, ptr %85, align 4
  br label %86

86:                                               ; preds = %76
  %87 = load i32, ptr %6, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %6, align 4
  br label %16, !llvm.loop !11

89:                                               ; preds = %16
  br label %90

90:                                               ; preds = %89
  %91 = load i32, ptr %5, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %5, align 4
  br label %12, !llvm.loop !12

93:                                               ; preds = %12
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @app() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [131072 x i32], align 16
  %5 = alloca [131072 x i32], align 16
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %9 = getelementptr inbounds [131072 x i32], ptr %4, i64 0, i64 0
  store ptr %9, ptr %6, align 8
  %10 = getelementptr inbounds [131072 x i32], ptr %5, i64 0, i64 0
  store ptr %10, ptr %7, align 8
  store i32 0, ptr %2, align 4
  br label %11

11:                                               ; preds = %32, %0
  %12 = load i32, ptr %2, align 4
  %13 = icmp ult i32 %12, 256
  br i1 %13, label %14, label %35

14:                                               ; preds = %11
  store i32 0, ptr %1, align 4
  br label %15

15:                                               ; preds = %28, %14
  %16 = load i32, ptr %1, align 4
  %17 = icmp ult i32 %16, 512
  br i1 %17, label %18, label %31

18:                                               ; preds = %15
  %19 = call i32 (...) @simRand()
  %20 = srem i32 %19, 2
  %21 = load ptr, ptr %7, align 8
  %22 = load i32, ptr %2, align 4
  %23 = mul i32 %22, 512
  %24 = load i32, ptr %1, align 4
  %25 = add i32 %23, %24
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr %21, i64 %26
  store i32 %20, ptr %27, align 4
  br label %28

28:                                               ; preds = %18
  %29 = load i32, ptr %1, align 4
  %30 = add i32 %29, 1
  store i32 %30, ptr %1, align 4
  br label %15, !llvm.loop !13

31:                                               ; preds = %15
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %2, align 4
  %34 = add i32 %33, 1
  store i32 %34, ptr %2, align 4
  br label %11, !llvm.loop !14

35:                                               ; preds = %11
  %36 = load ptr, ptr %7, align 8
  call void @drawGen(ptr noundef %36)
  store i32 0, ptr %3, align 4
  br label %37

37:                                               ; preds = %47, %35
  %38 = load i32, ptr %3, align 4
  %39 = icmp ult i32 %38, 1024
  br i1 %39, label %40, label %50

40:                                               ; preds = %37
  %41 = load ptr, ptr %6, align 8
  %42 = load ptr, ptr %7, align 8
  call void @calcGen(ptr noundef %41, ptr noundef %42)
  %43 = load ptr, ptr %6, align 8
  call void @drawGen(ptr noundef %43)
  %44 = load ptr, ptr %7, align 8
  store ptr %44, ptr %8, align 8
  %45 = load ptr, ptr %6, align 8
  store ptr %45, ptr %7, align 8
  %46 = load ptr, ptr %8, align 8
  store ptr %46, ptr %6, align 8
  br label %47

47:                                               ; preds = %40
  %48 = load i32, ptr %3, align 4
  %49 = add i32 %48, 1
  store i32 %49, ptr %3, align 4
  br label %37, !llvm.loop !15

50:                                               ; preds = %37
  ret void
}

declare i32 @simRand(...) #1

attributes #0 = { noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 16.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
