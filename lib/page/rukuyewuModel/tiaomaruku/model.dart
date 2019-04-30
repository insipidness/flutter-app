import 'package:flutter/material.dart';

/// 入库业务页面页面布局
/// [tableView] 头部布局配置文件
/// [column] 行布局
///  
var rukuyewuModel = {
    'tableView': [
        {
            'column': {
                'row': [
                    {
                        'name': '单据号：',
                        'type': 'lable',
                    },
                    {
                        'name': 'cdj',
                        'type': 'input',
                        'enabled': false,
                        'value': '',
                    },
                    {
                        'name': '仓库：',
                        'type': 'lable', 
                    },
                    {
                        'name': 'cdj',
                        'type': 'input',
                        'enabled': false,
                        'value': '',  
                    }
                ]
            },
            
        },
        {
            'column': {
                'row': [
                    {
                        'name': 'weisaoshuliang',
                        'type': 'input',
                        'enabled': false,
                        'value': '',
                    },
                    {
                        'name': '货位：',
                        'type': 'lable',
                    },
                    {
                        'name': 'chw',
                        'type': 'input',
                        'enabled': true,
                        'value': '', 
                    },
                    {
                        'name': '',
                        'type': 'icon',
                        'value': Icons.crop_free
                    }
                ]
            }
        },
        {
            'column': {
                'row': [
                    {
                        'name': '未扫数量：',
                        'type': 'lable',
                    },
                    {
                        'name': 'weisaoshuliang',
                        'type': 'input',
                        'enabled': false,
                        'value': '',
                    },
                    {
                        'name': '实际数量：',
                        'type': 'lable',
                    },
                    {
                        'name': 'shijishuliang',
                        'type': 'input',
                        'enabled': false,
                        'value': '',
                    }
                ]
            }
        }
    ],
    'groupView': [
        {
            'label': '保存',
            'icon': Icons.save,
            'dispath': ''
        },
        {
            'label': '重置',
            'icon': Icons.autorenew,
            'dispath': ''
        },
        {
            'label': '添加',
            'icon': Icons.add_circle_outline,
            'dispath': ''
        }
    ]
};