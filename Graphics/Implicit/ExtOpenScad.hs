-- Implicit CAD. Copyright (C) 2011, Christopher Olah (chris@colah.ca)
-- Released under the GNU GPL, see LICENSE

-- We'd like to parse openscad code, with some improvements, for backwards compatability.

module Graphics.Implicit.ExtOpenScad (runOpenscad, OVal (..) ) where

import Graphics.Implicit.Definitions
import Graphics.Implicit.ExtOpenScad.Definitions
import Graphics.Implicit.ExtOpenScad.Parser.Statement
import Graphics.Implicit.ExtOpenScad.Eval.Statement
import Graphics.Implicit.ExtOpenScad.Default (defaultObjects)
import Graphics.Implicit.ExtOpenScad.Util.OVal

import qualified Data.Maybe as Maybe
import qualified Data.List as List
import qualified Data.Map as Map
import           Data.Map (Map)
import qualified Control.Monad as Monad
import qualified Control.Monad.State as State
import           Control.Monad.State (State,StateT, get, put, modify, liftIO)
import qualified System.Directory as Dir

-- Small wrapper to handle parse errors, etc
runOpenscad s =
	let
		initial =  defaultObjects
		rearrange (_, (varlookup, ovals, _ , _ , _)) = (varlookup, obj2s, obj3s) where
			(obj2s, obj3s, others) = divideObjs ovals
	in case parseProgram "" s of
		Left e -> Left e
		Right sts -> Right
			$ fmap rearrange
			$ (\sts -> do
				path <- Dir.getCurrentDirectory
				State.runStateT sts (initial, [], path, (), () )
			)
			$ Monad.mapM_ runStatementI sts



