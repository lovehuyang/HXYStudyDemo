//
//  Header.h
//  HXYStudyDemo
//
//  Created by tzsoft on 2017/8/9.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#ifndef Header_h
#define Header_h
#define TEST 10

//DEBUG 模式下打印日志,当前行
#ifdef DEBUG

#define DLog(format,...) printf("%s [Line %d]  \n%s\n",__PRETTY_FUNCTION__, __LINE__,[[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )

#else

# define DLog(...)

#endif

#endif /* Header_h */
