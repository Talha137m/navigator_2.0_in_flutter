import 'package:flutter/material.dart';

class NoAnimationTransitionDelegate extends TransitionDelegate<RouteSettings> {
  @override
  Iterable<RouteTransitionRecord> resolve(
      {required List<RouteTransitionRecord> newPageRouteHistory,
      required Map<RouteTransitionRecord?, RouteTransitionRecord>
          locationToExitingPageRoute,
      required Map<RouteTransitionRecord?, List<RouteTransitionRecord>>
          pageRouteToPagelessRoutes}) {
    final result = <RouteTransitionRecord>[];
    for (final pageRoute in newPageRouteHistory) {
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      result.add(pageRoute);
    }

    for (final RouteTransitionRecord exitingPageRoute
        in locationToExitingPageRoute.values) {
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();

        final List<RouteTransitionRecord>? pageLessRoutes =
            pageRouteToPagelessRoutes[exitingPageRoute];
        if (pageLessRoutes != null) {
          for (final RouteTransitionRecord pagelessRoute in pageLessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }
      result.add(exitingPageRoute);
    }
    return result;
  }
}
