; ModuleID = 'game.c'
source_filename = "game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.game_t = type { [2500 x i8], [2500 x i8], ptr, ptr }

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i64 @get_pos(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 50
  %9 = load i32, ptr %3, align 4
  %10 = sext i32 %9 to i64
  %11 = add i64 %8, %10
  store i64 %11, ptr %5, align 8
  %12 = load i64, ptr %5, align 8
  ret i64 %12
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local zeroext i1 @get_pixel(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %9 = load i32, ptr %6, align 4
  %10 = icmp sge i32 %9, 50
  br i1 %10, label %14, label %11

11:                                               ; preds = %3
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %3
  store i1 false, ptr %4, align 1
  br label %31

15:                                               ; preds = %11
  %16 = load i32, ptr %7, align 4
  %17 = icmp sge i32 %16, 50
  br i1 %17, label %21, label %18

18:                                               ; preds = %15
  %19 = load i32, ptr %7, align 4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %18, %15
  store i1 false, ptr %4, align 1
  br label %31

22:                                               ; preds = %18
  %23 = load i32, ptr %6, align 4
  %24 = load i32, ptr %7, align 4
  %25 = call i64 @get_pos(i32 noundef %23, i32 noundef %24)
  store i64 %25, ptr %8, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = load i64, ptr %8, align 8
  %28 = getelementptr inbounds i8, ptr %26, i64 %27
  %29 = load i8, ptr %28, align 1
  %30 = trunc i8 %29 to i1
  store i1 %30, ptr %4, align 1
  br label %31

31:                                               ; preds = %22, %21, %14
  %32 = load i1, ptr %4, align 1
  ret i1 %32
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @set_pixel(ptr noundef %0, i32 noundef %1, i32 noundef %2, i1 noundef zeroext %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  %9 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %10 = zext i1 %3 to i8
  store i8 %10, ptr %8, align 1
  %11 = load i32, ptr %6, align 4
  %12 = icmp sge i32 %11, 50
  br i1 %12, label %16, label %13

13:                                               ; preds = %4
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %13, %4
  br label %34

17:                                               ; preds = %13
  %18 = load i32, ptr %7, align 4
  %19 = icmp sge i32 %18, 50
  br i1 %19, label %23, label %20

20:                                               ; preds = %17
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %20, %17
  br label %34

24:                                               ; preds = %20
  %25 = load i32, ptr %6, align 4
  %26 = load i32, ptr %7, align 4
  %27 = call i64 @get_pos(i32 noundef %25, i32 noundef %26)
  store i64 %27, ptr %9, align 8
  %28 = load i8, ptr %8, align 1
  %29 = trunc i8 %28 to i1
  %30 = load ptr, ptr %5, align 8
  %31 = load i64, ptr %9, align 8
  %32 = getelementptr inbounds i8, ptr %30, i64 %31
  %33 = zext i1 %29 to i8
  store i8 %33, ptr %32, align 1
  br label %34

34:                                               ; preds = %24, %23, %16
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @init_game(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.game_t, ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds [2500 x i8], ptr %4, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 2500, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.game_t, ptr %6, i32 0, i32 1
  %8 = getelementptr inbounds [2500 x i8], ptr %7, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 2500, i1 false)
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.game_t, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds [2500 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds %struct.game_t, ptr %12, i32 0, i32 2
  store ptr %11, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.game_t, ptr %14, i32 0, i32 1
  %16 = getelementptr inbounds [2500 x i8], ptr %15, i64 0, i64 0
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.game_t, ptr %17, i32 0, i32 3
  store ptr %16, ptr %18, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local zeroext i1 @init_from_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call noalias ptr @fopen(ptr noundef %9, ptr noundef @.str)
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %14, label %13

13:                                               ; preds = %2
  store i1 false, ptr %3, align 1
  br label %35

14:                                               ; preds = %2
  store i64 0, ptr %8, align 8
  br label %15

15:                                               ; preds = %23, %14
  %16 = load ptr, ptr %6, align 8
  %17 = call i32 @fgetc(ptr noundef %16)
  store i32 %17, ptr %7, align 4
  %18 = icmp ne i32 %17, -1
  br i1 %18, label %19, label %34

19:                                               ; preds = %15
  %20 = load i64, ptr %8, align 8
  %21 = icmp uge i64 %20, 2500
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i1 false, ptr %3, align 1
  br label %35

23:                                               ; preds = %19
  %24 = load i32, ptr %7, align 4
  %25 = icmp eq i32 %24, 49
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.game_t, ptr %26, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  %29 = load i64, ptr %8, align 8
  %30 = getelementptr inbounds i8, ptr %28, i64 %29
  %31 = zext i1 %25 to i8
  store i8 %31, ptr %30, align 1
  %32 = load i64, ptr %8, align 8
  %33 = add i64 %32, 1
  store i64 %33, ptr %8, align 8
  br label %15, !llvm.loop !6

34:                                               ; preds = %15
  store i1 true, ptr %3, align 1
  br label %35

35:                                               ; preds = %34, %22, %13
  %36 = load i1, ptr %3, align 1
  ret i1 %36
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #2

declare i32 @fgetc(ptr noundef) #2

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local zeroext i1 @make_iteration(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i8 0, ptr %3, align 1
  store i32 0, ptr %4, align 4
  br label %11

11:                                               ; preds = %79, %1
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %12, 50
  br i1 %13, label %14, label %82

14:                                               ; preds = %11
  store i32 0, ptr %5, align 4
  br label %15

15:                                               ; preds = %75, %14
  %16 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %16, 50
  br i1 %17, label %18, label %78

18:                                               ; preds = %15
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %19

19:                                               ; preds = %47, %18
  %20 = load i32, ptr %7, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %50

22:                                               ; preds = %19
  store i32 0, ptr %8, align 4
  br label %23

23:                                               ; preds = %43, %22
  %24 = load i32, ptr %8, align 4
  %25 = icmp slt i32 %24, 3
  br i1 %25, label %26, label %46

26:                                               ; preds = %23
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.game_t, ptr %27, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %7, align 4
  %32 = sub nsw i32 %30, %31
  %33 = add nsw i32 %32, 1
  %34 = load i32, ptr %5, align 4
  %35 = load i32, ptr %8, align 4
  %36 = sub nsw i32 %34, %35
  %37 = add nsw i32 %36, 1
  %38 = call zeroext i1 @get_pixel(ptr noundef %29, i32 noundef %33, i32 noundef %37)
  br i1 %38, label %39, label %42

39:                                               ; preds = %26
  %40 = load i32, ptr %6, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %6, align 4
  br label %42

42:                                               ; preds = %39, %26
  br label %43

43:                                               ; preds = %42
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %8, align 4
  br label %23, !llvm.loop !8

46:                                               ; preds = %23
  br label %47

47:                                               ; preds = %46
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %7, align 4
  br label %19, !llvm.loop !9

50:                                               ; preds = %19
  %51 = load i32, ptr %6, align 4
  %52 = icmp sge i32 %51, 3
  br i1 %52, label %53, label %56

53:                                               ; preds = %50
  %54 = load i32, ptr %6, align 4
  %55 = icmp sle i32 %54, 4
  br label %56

56:                                               ; preds = %53, %50
  %57 = phi i1 [ false, %50 ], [ %55, %53 ]
  %58 = zext i1 %57 to i8
  store i8 %58, ptr %9, align 1
  %59 = load ptr, ptr %2, align 8
  %60 = getelementptr inbounds %struct.game_t, ptr %59, i32 0, i32 3
  %61 = load ptr, ptr %60, align 8
  %62 = load i32, ptr %4, align 4
  %63 = load i32, ptr %5, align 4
  %64 = load i8, ptr %9, align 1
  %65 = trunc i8 %64 to i1
  call void @set_pixel(ptr noundef %61, i32 noundef %62, i32 noundef %63, i1 noundef zeroext %65)
  %66 = load i8, ptr %9, align 1
  %67 = trunc i8 %66 to i1
  %68 = zext i1 %67 to i32
  %69 = load i8, ptr %3, align 1
  %70 = trunc i8 %69 to i1
  %71 = zext i1 %70 to i32
  %72 = or i32 %71, %68
  %73 = icmp ne i32 %72, 0
  %74 = zext i1 %73 to i8
  store i8 %74, ptr %3, align 1
  br label %75

75:                                               ; preds = %56
  %76 = load i32, ptr %5, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %5, align 4
  br label %15, !llvm.loop !10

78:                                               ; preds = %15
  br label %79

79:                                               ; preds = %78
  %80 = load i32, ptr %4, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, ptr %4, align 4
  br label %11, !llvm.loop !11

82:                                               ; preds = %11
  %83 = load ptr, ptr %2, align 8
  %84 = getelementptr inbounds %struct.game_t, ptr %83, i32 0, i32 2
  %85 = load ptr, ptr %84, align 8
  store ptr %85, ptr %10, align 8
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr inbounds %struct.game_t, ptr %86, i32 0, i32 3
  %88 = load ptr, ptr %87, align 8
  %89 = load ptr, ptr %2, align 8
  %90 = getelementptr inbounds %struct.game_t, ptr %89, i32 0, i32 2
  store ptr %88, ptr %90, align 8
  %91 = load ptr, ptr %10, align 8
  %92 = load ptr, ptr %2, align 8
  %93 = getelementptr inbounds %struct.game_t, ptr %92, i32 0, i32 3
  store ptr %91, ptr %93, align 8
  %94 = load i8, ptr %3, align 1
  %95 = trunc i8 %94 to i1
  ret i1 %95
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @run_game(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca %struct.game_t, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  call void @init_game(ptr noundef %5)
  %8 = load i32, ptr %3, align 4
  %9 = icmp sge i32 %8, 2
  br i1 %9, label %10, label %15

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds ptr, ptr %11, i64 1
  %13 = load ptr, ptr %12, align 8
  %14 = call zeroext i1 @init_from_file(ptr noundef %5, ptr noundef %13)
  br label %15

15:                                               ; preds = %10, %2
  br label %16

16:                                               ; preds = %43, %15
  %17 = call zeroext i1 @make_iteration(ptr noundef %5)
  br i1 %17, label %18, label %44

18:                                               ; preds = %16
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %40, %18
  %20 = load i32, ptr %6, align 4
  %21 = icmp slt i32 %20, 50
  br i1 %21, label %22, label %43

22:                                               ; preds = %19
  store i32 0, ptr %7, align 4
  br label %23

23:                                               ; preds = %36, %22
  %24 = load i32, ptr %7, align 4
  %25 = icmp slt i32 %24, 50
  br i1 %25, label %26, label %39

26:                                               ; preds = %23
  %27 = load i32, ptr %6, align 4
  %28 = load i32, ptr %7, align 4
  %29 = getelementptr inbounds %struct.game_t, ptr %5, i32 0, i32 2
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %7, align 4
  %33 = call zeroext i1 @get_pixel(ptr noundef %30, i32 noundef %31, i32 noundef %32)
  %34 = zext i1 %33 to i64
  %35 = select i1 %33, i32 -1, i32 -16777216
  call void @put_pixel(i32 noundef %27, i32 noundef %28, i32 noundef %35)
  br label %36

36:                                               ; preds = %26
  %37 = load i32, ptr %7, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %7, align 4
  br label %23, !llvm.loop !12

39:                                               ; preds = %23
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %6, align 4
  br label %19, !llvm.loop !13

43:                                               ; preds = %19
  call void (...) @flush()
  br label %16, !llvm.loop !14

44:                                               ; preds = %16
  ret i32 0
}

declare void @put_pixel(i32 noundef, i32 noundef, i32 noundef) #2

declare void @flush(...) #2

attributes #0 = { noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
