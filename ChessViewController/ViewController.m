//
//  ViewController.m
//  ChessViewController
//
//  Created by kaikai on 2024/8/2.
//

#import "ViewController.h"

@interface ViewController ()

// 定义一个二维数组保存棋子的位置和类型
@property (nonatomic, strong) NSArray *chessBoard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建 UILabel 显示标题
    UILabel *chessLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 50)];
    chessLabel.text = @"中国象棋";
    chessLabel.textColor = [UIColor blackColor];
    chessLabel.textAlignment = NSTextAlignmentCenter;
    chessLabel.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:chessLabel];
    
    // 初始化棋盘
    [self setupChessBoard];
    
    // 绘制棋盘和棋子
    [self drawChessBoard];
}

// 初始化棋盘上的棋子
- (void)setupChessBoard {
    self.chessBoard = @[
        @[@"车", @"马", @"相", @"士", @"将", @"士", @"相", @"马", @"车"],
        @[@"", @"", @"", @"", @"", @"", @"", @"", @""],
        @[@"", @"炮", @"", @"", @"", @"", @"", @"炮", @""],
        @[@"兵", @"", @"兵", @"", @"兵", @"", @"兵", @"", @"兵"],
        @[@"", @"", @"", @"", @"", @"", @"", @"", @""],
        @[@"", @"", @"", @"", @"", @"", @"", @"", @""],
        @[@"卒", @"", @"卒", @"", @"卒", @"", @"卒", @"", @"卒"],
        @[@"", @"炮", @"", @"", @"", @"", @"", @"炮", @""],
        @[@"", @"", @"", @"", @"", @"", @"", @"", @""],
        @[@"車", @"馬", @"象", @"仕", @"帥", @"仕", @"象", @"馬", @"車"]
    ];
}

// 绘制棋盘和棋子
- (void)drawChessBoard {
    CGFloat boardSize = self.view.bounds.size.width - 40;
    CGFloat cellSize = boardSize / 9;
    
    UIView *boardView = [[UIView alloc] initWithFrame:CGRectMake(20, 120, boardSize, boardSize)];
    boardView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:boardView];
    
    for (int row = 0; row < 10; row++) {
        for (int col = 0; col < 9; col++) {
            UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(col * cellSize, row * cellSize, cellSize, cellSize)];
            cellView.backgroundColor = (row + col) % 2 == 0 ? [UIColor whiteColor] : [UIColor blackColor];
            [boardView addSubview:cellView];
            
            NSString *piece = self.chessBoard[row][col];
            if (![piece isEqualToString:@""]) {
                UILabel *pieceLabel = [[UILabel alloc] initWithFrame:cellView.bounds];
                pieceLabel.text = piece;
                pieceLabel.textColor = [UIColor redColor];
                pieceLabel.textAlignment = NSTextAlignmentCenter;
                pieceLabel.font = [UIFont boldSystemFontOfSize:24];
                [cellView addSubview:pieceLabel];
            }
        }
    }
}

@end
