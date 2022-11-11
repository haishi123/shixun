-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-11-11 11:28:40
-- 服务器版本： 5.7.40-log
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `studentsql`
--

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE `class` (
  `ID` int(20) NOT NULL COMMENT '序号',
  `classid` varchar(20) NOT NULL COMMENT '班级名称',
  `classname` varchar(20) NOT NULL COMMENT '班级名称',
  `Mid` varchar(20) NOT NULL COMMENT '专业编号',
  `Did` varchar(20) NOT NULL COMMENT '部门编号',
  `cnumber` int(20) NOT NULL COMMENT '班级人数'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `class`
--

INSERT INTO `class` (`ID`, `classid`, `classname`, `Mid`, `Did`, `cnumber`) VALUES
(1, '001', 'class01', '001', '001', 10),
(2, '002', 'class02', '001', '001', 10),
(3, '003', 'class03', '002', '002', 5),
(4, '004', 'class04', '002', '002', 5);

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `ID` int(20) NOT NULL COMMENT '序号',
  `cno` varchar(20) NOT NULL COMMENT '课程号',
  `cname` varchar(20) NOT NULL COMMENT '课程名',
  `period` int(20) NOT NULL COMMENT '学时',
  `credit` int(20) NOT NULL COMMENT '学分'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`ID`, `cno`, `cname`, `period`, `credit`) VALUES
(1, '001', 'course01', 1, 2),
(2, '002', 'course01', 1, 2),
(3, '003', 'course03', 1, 3),
(4, '004', 'course04', 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE `department` (
  `ID` int(20) NOT NULL COMMENT '序号',
  `Did` varchar(20) NOT NULL COMMENT '部门编号',
  `Dname` varchar(20) NOT NULL COMMENT '部门名称'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `department`
--

INSERT INTO `department` (`ID`, `Did`, `Dname`) VALUES
(1, '001', 'department01'),
(2, '002', 'department02'),
(3, '003', 'department03');

-- --------------------------------------------------------

--
-- 表的结构 `grade`
--

CREATE TABLE `grade` (
  `ID` int(20) NOT NULL COMMENT '序号',
  `sno` varchar(20) NOT NULL COMMENT '学号',
  `cno` varchar(20) NOT NULL COMMENT '课程号',
  `grade` int(20) NOT NULL COMMENT '成绩'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `grade`
--

INSERT INTO `grade` (`ID`, `sno`, `cno`, `grade`) VALUES
(1, '00001', '001', 98),
(2, '00001', '002', 80),
(3, '00002', '001', 88),
(4, '00002', '002', 90);

-- --------------------------------------------------------

--
-- 表的结构 `major`
--

CREATE TABLE `major` (
  `ID` int(20) NOT NULL COMMENT '序号',
  `Mid` varchar(20) NOT NULL COMMENT '专业名称',
  `Did` varchar(20) NOT NULL COMMENT '部门名称',
  `Mname` varchar(20) NOT NULL COMMENT '专业名称'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `major`
--

INSERT INTO `major` (`ID`, `Mid`, `Did`, `Mname`) VALUES
(1, '001', '001', 'math1'),
(2, '002', '001', 'math2'),
(3, '003', '002', 'english1'),
(4, '004', '002', 'english2'),
(5, '005', '003', 'computer1'),
(6, '006', '003', 'computer2');

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `ID` int(20) NOT NULL COMMENT '序号',
  `sno` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '学号',
  `sname` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET latin1 NOT NULL COMMENT '性别',
  `Classid` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '班级编号',
  `Mid` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '专业编号',
  `Did` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '系部编号',
  `nation` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT '民族',
  `age` int(20) NOT NULL COMMENT '年龄',
  `enroll` date NOT NULL COMMENT '入学日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`ID`, `sno`, `sname`, `sex`, `Classid`, `Mid`, `Did`, `nation`, `age`, `enroll`) VALUES
(1, '00001', 'Mary', 'F', '001', '001', '001', 'han', 22, '2022-09-01'),
(2, '00002', 'Mike', 'M', '001', '002', '001', 'han', 21, '2022-09-01');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `ID` int(20) NOT NULL COMMENT '序号',
  `user` varchar(20) NOT NULL COMMENT '账户',
  `password` varchar(20) NOT NULL COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转储表的索引
--

--
-- 表的索引 `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classid`),
  ADD KEY `ID` (`ID`),
  ADD KEY `c_major` (`Mid`),
  ADD KEY `c_departemnt` (`Did`);

--
-- 表的索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cno`),
  ADD KEY `ID` (`ID`);

--
-- 表的索引 `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Did`),
  ADD KEY `ID` (`ID`);

--
-- 表的索引 `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`sno`,`cno`),
  ADD KEY `ID` (`ID`),
  ADD KEY `g_cno` (`cno`);

--
-- 表的索引 `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`Mid`),
  ADD KEY `m_Did` (`Did`),
  ADD KEY `ID` (`ID`);

--
-- 表的索引 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `s_Did` (`Did`),
  ADD KEY `ID` (`ID`),
  ADD KEY `s_class` (`Classid`),
  ADD KEY `s_major` (`Mid`);

--
-- 表的索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user`),
  ADD KEY `ID` (`ID`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `class`
--
ALTER TABLE `class`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `course`
--
ALTER TABLE `course`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `grade`
--
ALTER TABLE `grade`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `major`
--
ALTER TABLE `major`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `student`
--
ALTER TABLE `student`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(20) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- 限制导出的表
--

--
-- 限制表 `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `c_departemnt` FOREIGN KEY (`Did`) REFERENCES `department` (`Did`),
  ADD CONSTRAINT `c_major` FOREIGN KEY (`Mid`) REFERENCES `major` (`Mid`);

--
-- 限制表 `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `g_cno` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`),
  ADD CONSTRAINT `g_sno` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`);

--
-- 限制表 `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `m_Did` FOREIGN KEY (`Did`) REFERENCES `department` (`Did`);

--
-- 限制表 `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `s_class` FOREIGN KEY (`Classid`) REFERENCES `class` (`classid`),
  ADD CONSTRAINT `s_major` FOREIGN KEY (`Mid`) REFERENCES `major` (`Mid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
